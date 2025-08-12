
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MusicNFTPlatform is ERC721, ERC721URIStorage, Ownable, ReentrancyGuard {
    uint256 private _tokenIdCounter;
    uint256 public platformFeePercentage = 250; // 2.5% fee
    
    struct MusicNFT {
        address artist;
        uint256 price;
        uint256 royaltyPercentage; // Basis points (e.g., 500 = 5%)
        bool forSale;
        string title;
        string genre;
    }
    
    mapping(uint256 => MusicNFT) public musicNFTs;
    mapping(address => uint256) public artistEarnings;
    
    event MusicNFTMinted(
        uint256 indexed tokenId,
        address indexed artist,
        string title,
        string genre,
        uint256 royaltyPercentage
    );
    
    event MusicNFTListed(uint256 indexed tokenId, uint256 price);
    event MusicNFTSold(
        uint256 indexed tokenId,
        address indexed seller,
        address indexed buyer,
        uint256 price
    );
    event RoyaltyPaid(
        uint256 indexed tokenId,
        address indexed artist,
        uint256 amount
    );
    
    constructor() ERC721("MusicNFT", "MNFT") Ownable(msg.sender) {}
    
    /**
     * @dev Mint a new music NFT
     * @param to Address to mint the NFT to
     * @param _tokenURI Metadata URI for the music NFT
     * @param title Title of the music track
     * @param genre Genre of the music
     * @param royaltyPercentage Royalty percentage in basis points (max 1000 = 10%)
     */
    function mintMusicNFT(
        address to,
        string memory _tokenURI,
        string memory title,
        string memory genre,
        uint256 royaltyPercentage
    ) public {
        require(royaltyPercentage <= 1000, "Royalty too high"); // Max 10%
        require(bytes(title).length > 0, "Title cannot be empty");
        require(bytes(genre).length > 0, "Genre cannot be empty");
        
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
        
        musicNFTs[tokenId] = MusicNFT({
            artist: to,
            price: 0,
            royaltyPercentage: royaltyPercentage,
            forSale: false,
            title: title,
            genre: genre
        });
        
        emit MusicNFTMinted(tokenId, to, title, genre, royaltyPercentage);
    }
    
    /**
     * @dev List a music NFT for sale
     * @param tokenId Token ID to list
     * @param price Price in wei
     */
    function listForSale(uint256 tokenId, uint256 price) public {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        require(price > 0, "Price must be greater than 0");
        
        musicNFTs[tokenId].price = price;
        musicNFTs[tokenId].forSale = true;
        
        emit MusicNFTListed(tokenId, price);
    }
    
    /**
     * @dev Purchase a music NFT
     * @param tokenId Token ID to purchase
     */
    function purchaseNFT(uint256 tokenId) public payable nonReentrant {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        require(musicNFTs[tokenId].forSale, "NFT not for sale");
        require(msg.value >= musicNFTs[tokenId].price, "Insufficient payment");
        
        address seller = ownerOf(tokenId);
        address artist = musicNFTs[tokenId].artist;
        uint256 price = musicNFTs[tokenId].price;
        uint256 royaltyPercentage = musicNFTs[tokenId].royaltyPercentage;
        
        require(seller != msg.sender, "Cannot buy your own NFT");
        
        // Calculate fees and royalties
        uint256 platformFee = (price * platformFeePercentage) / 10000;
        uint256 artistRoyalty = 0;
        
        // Only pay royalty if seller is not the original artist
        if (seller != artist) {
            artistRoyalty = (price * royaltyPercentage) / 10000;
            artistEarnings[artist] += artistRoyalty;
        }
        
        uint256 sellerAmount = price - platformFee - artistRoyalty;
        
        // Transfer ownership
        _transfer(seller, msg.sender, tokenId);
        musicNFTs[tokenId].forSale = false;
        musicNFTs[tokenId].price = 0;
        
        // Transfer payments
        payable(seller).transfer(sellerAmount);
        if (artistRoyalty > 0) {
            payable(artist).transfer(artistRoyalty);
            emit RoyaltyPaid(tokenId, artist, artistRoyalty);
        }
        
        // Refund excess payment
        if (msg.value > price) {
            payable(msg.sender).transfer(msg.value - price);
        }
        
        emit MusicNFTSold(tokenId, seller, msg.sender, price);
    }
    
    /**
     * @dev Withdraw accumulated earnings for artists
     */
    function withdrawEarnings() public nonReentrant {
        uint256 earnings = artistEarnings[msg.sender];
        require(earnings > 0, "No earnings to withdraw");
        
        artistEarnings[msg.sender] = 0;
        payable(msg.sender).transfer(earnings);
    }
    
    /**
     * @dev Get total number of minted tokens
     */
    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter;
    }
    
    // Override required functions
    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }
    
    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
    
    // Owner functions
    function withdrawPlatformFees() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No fees to withdraw");
        payable(owner()).transfer(balance);
    }
    
    function updatePlatformFee(uint256 newFeePercentage) public onlyOwner {
        require(newFeePercentage <= 1000, "Fee too high"); // Max 10%
        platformFeePercentage = newFeePercentage;
    }
}
