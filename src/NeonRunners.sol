pragma solidity ^0.8.14;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";

error MaxQuantityExceeded();
error InsufficientEther();
error ExceedsMaximumSupply();

contract NeonRunners is ERC721A, Ownable {
    uint256 public constant MINT_PRICE = 0.012 ether;
    uint16 public constant MAX_TOKENS = 345;

    string public baseURI = "";

    constructor() ERC721A("neon runners", "RUNNER") {
        _mintERC2309(msg.sender, 10);
    }

    function runRunRun(uint256 qty) external payable {
        unchecked {
            if(MINT_PRICE * qty > msg.value) revert InsufficientEther();
            if(totalSupply() + qty > MAX_TOKENS) revert ExceedsMaximumSupply();

            _mint(msg.sender, qty);
        }
    }

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string memory newBaseURI) external onlyOwner {
        baseURI = newBaseURI;
    }
}