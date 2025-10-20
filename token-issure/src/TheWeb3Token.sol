// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract TheWeb3Token is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, OwnableUpgradeable {
    string private constant NAME = "TheWebThreeToken";
    string private constant SYMBOL = "TWT";

    uint256 public constant MIN_MINT_INTERVAL = 365 days;

    uint256 public constant MINT_CAP_DENOMINATOR = 10_000;

    uint256 public constant MINT_CAP_MAX_NUMERATOR = 200;

    uint256 public mintCapNumerator;

    uint256 public nextMint;

    event MintCapNumeratorChanged(address indexed from, uint256 previousMintCapNumerator, uint256 newMintCapNumerator);

    error TheWeb3Token_ImproperlyInitialized();

    error TheWeb3Token_MintAmountTooLarge(uint256 amount, uint256 maximumAmount);

    error TheWeb3Token_NextMintTimestampNotElapsed(uint256 currentTimestamp, uint256 nextMintTimestamp);

    error TheWeb3Token_MintCapNumeratorTooLarge(uint256 numerator, uint256 maximumNumerator);

    constructor() {
        _disableInitializers();
    }

    function initialize(uint256 _initialSupply, address _owner) public initializer {
        if (_initialSupply == 0 || _owner == address(0)) revert TheWeb3Token_ImproperlyInitialized();

        __ERC20_init(NAME, SYMBOL);
        __ERC20Burnable_init();
        __Ownable_init(_owner);

        _mint(_owner, _initialSupply);

        nextMint = block.timestamp + MIN_MINT_INTERVAL;

        _transferOwnership(_owner);
    }

    function mint(address _recipient, uint256 _amount) public onlyOwner {
        uint256 maximumMintAmount = (totalSupply() * mintCapNumerator) / MINT_CAP_DENOMINATOR;
        if (_amount > maximumMintAmount) {
            revert TheWeb3Token_MintAmountTooLarge(_amount, maximumMintAmount);
        }
        if (block.timestamp < nextMint) revert TheWeb3Token_NextMintTimestampNotElapsed(block.timestamp, nextMint);

        nextMint = block.timestamp + MIN_MINT_INTERVAL;
        super._mint(_recipient, _amount);
    }

    function setMintCapNumerator(uint256 _mintCapNumerator) public onlyOwner {
        if (_mintCapNumerator > MINT_CAP_MAX_NUMERATOR) {
            revert TheWeb3Token_MintCapNumeratorTooLarge(_mintCapNumerator, MINT_CAP_MAX_NUMERATOR);
        }
        emit MintCapNumeratorChanged(msg.sender, mintCapNumerator, _mintCapNumerator);
        mintCapNumerator = _mintCapNumerator;
    }
}
