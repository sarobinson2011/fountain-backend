// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import {Script, console2} from "forge-std/Script.sol";
import {Reward} from "../src/tokencontract.sol";
import {LockDrop} from "../src/lockdrop.sol";
import {ILockDrop} from "../src/I.lockdrop.sol";
import {TokenManager} from "../src/rewardtokenmanager.sol";
import {ITokenManager} from "../src/I.tokenmanager.sol";


contract Deploy is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY_0x");
        address account = vm.addr(privateKey);
        uint256 supply = 1_000 * (10 ** 18);

        address vrfConsumer = 0x6B96bD3b4E1700FCFa3A6b3ce8cd6312933b7068;
        address randomnumbergenerator = 0xA78807ff0471Df36663f1E34c3Ce4f61b2928445; 
        // address tokenmanagerAddress =   0xdD559d1615BBb1b53cecf2026f0c355c6D760Dbb;

        address rewardAddress =   0x27346f96D479C15889eCB07CeCbFeaD536E9AF52;

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        TokenManager tokenmanager = new TokenManager();

        // deploy the RWDZ token contract
        // Reward reward = new Reward("Rewardz", "RWDZ", address(tokenmanager), supply);
        
        // set the Reward token address in TokenManager
        // ITokenManager(address(tokenmanager)).setRewardTokenAddress(address(reward));
        // ITokenManager(tokenmanagerAddress).setRewardTokenAddress(rewardAddress);
        
        // deploy lockdrop
        // new LockDrop(tokenmanagerAddress, vrfConsumer, randomnumbergenerator);

        // stop broadcast
        vm.stopBroadcast();
    }
}





// 1. deploy VRFv2Consumer contract (uint subscriptionId)                                  - yes
// 2. deploy RandomNumberGenerator (address VRFv2Consumer)                                 - yes
// 3. deploy TokenManager contract                                                         - no
// 4. deploy LockDrop (address tokenmanager, address vrfconsumer, randomnumbergenerator)   - no
// 5. Reward = reward;                                                                     - ?
