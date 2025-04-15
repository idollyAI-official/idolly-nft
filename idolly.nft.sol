// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";

contract IdollyNFT is ERC721URIStorage, Ownable, IERC2981 {
    uint256 public nextTokenId;

    string public baseURI;
    string private _contractMetadataURI;

    address public royaltyReceiver;
    uint96 public royaltyFeeBips; // 예: 1000 = 10%

    mapping(uint256 => string) private tokenRarities;

    event Minted(
        address indexed to,
        uint256 indexed tokenId,
        string rarity,
        string tokenURI
    );

    constructor(
        string memory _baseURI,
        string memory contractMetadataURI,
        address _royaltyReceiver,
        uint96 _royaltyFeeBips
    ) ERC721("IdollyNFT", "IDOL") Ownable(msg.sender) {
        baseURI = _baseURI;
        _contractMetadataURI = contractMetadataURI;
        royaltyReceiver = _royaltyReceiver;
        royaltyFeeBips = _royaltyFeeBips;
    }

    function mint(
        address to,
        string memory rarity,
        string memory tokenURI
    ) external onlyOwner returns (uint256) {
        uint256 tokenId = nextTokenId;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        tokenRarities[tokenId] = rarity;
        nextTokenId++;
        emit Minted(to, tokenId, rarity, tokenURI);
        return tokenId;
    }

    function getRarity(uint256 tokenId) public view returns (string memory) {
        require(ownerOf(tokenId) != address(0), "Token does not exist");

        return tokenRarities[tokenId];
    }

    // OpenSea에서 컬렉션 메타데이터 확인용
    function contractURI() public view returns (string memory) {
        return _contractMetadataURI;
    }

    // EIP-2981 로열티 정보
    function royaltyInfo(
        uint256, /* tokenId */
        uint256 salePrice
    ) external view override returns (address receiver, uint256 royaltyAmount) {
        receiver = royaltyReceiver;
        royaltyAmount = (salePrice * royaltyFeeBips) / 10000;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721URIStorage, IERC165)
        returns (bool)
    {
        return
            interfaceId == type(IERC2981).interfaceId ||
            super.supportsInterface(interfaceId);
    }
}
