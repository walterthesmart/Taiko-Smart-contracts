// SPDX-License-Identifier: MIT

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {IYieldTracker} from "./interfaces/IYieldTracker.sol";
import {IBaseToken} from "./interfaces/IBaseToken.sol";
import {IMintable} from "./interfaces/IMintable.sol";
import {MintableBaseToken} from "./MintableBaseToken.sol";

pragma solidity 0.8.20;

contract MONEYKUDIEGO is MintableBaseToken {
    constructor() MintableBaseToken("MONEYKUDIEGO on Berachain", "MKE", 10000000000000000000000000) {
    }

    function id() external pure returns (string memory _name) {
        return "MKE";
    }
}