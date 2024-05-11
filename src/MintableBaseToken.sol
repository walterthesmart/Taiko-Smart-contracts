//SPDX-License-Identifier: MIT

import {BaseToken} from "./BaseToken.sol";
import {IMintable} from "./interfaces/IMintable.sol";


pragma solidity 0.8.20;


contract MintableBaseToken is BaseToken, IMintable {

    mapping (address => bool) public isMinter;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) public BaseToken(_name, _symbol, _initialSupply) {
    }

    modifier onlyMinter() {
        require(isMinter[msg.sender], "MintableBaseToken: forbidden");
        _;
    }

    function setMinter(address _minter, bool _isActive) external onlyGov {
        isMinter[_minter] = _isActive;
    }

    function mint(address _account, uint256 _amount) external override onlyMinter {
        _mint(_account, _amount);
    }

    function burn(address _account, uint256 _amount) external override onlyMinter {
        _burn(_account, _amount);
    }
}