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

        console.log("Account:", account);

        // start broadcast
        vm.startBroadcast(privateKey);

        // deploy reward token manager
        TokenManager tokenmanager = new TokenManager();
        // deploy the RWDZ token contract
        Reward reward = new Reward("Rewardz", "RWDZ", address(tokenmanager), supply);
        // set the Reward token address in TokenManager
        ITokenManager(address(tokenmanager)).setRewardTokenAddress(address(reward));
        // deploy lockdrop
        new LockDrop(address(tokenmanager));

        // stop broadcast
        vm.stopBroadcast();
    }
}

// address tokenmanager 0x4c523EA66f07a6d67E9F313df51B7D4C2E8d451a
// address reward 0x1d037b6b3F58652d83D10a21E8e06CA262F442c1
// address lockdrop 0x4289aCdD394446D96c2F6E27E530C3f497c68577













// forge script script/deploy_simple.s.sol:DeploySimple
// forge script script/deploy_simple.s.sol:DeploySimple --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv

// forge create --rpc-url INSERT_RPC_API_ENDPOINT \
// --constructor-args 100 \
// --private-key INSERT_YOUR_PRIVATE_KEY \
// src/MyToken.sol:MyToken

// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL --verify      <-- success
//
// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $AURORA_TEST_RPC_URL           <-- fail
// forge create src/simple.sol:SimpleToken --private-key $PRIVATE_KEY --rpc-url $AURORA_TEST_RPC_URL --legacy  <-- success
//      --legacy --verify       <-- fail

// forge create --rpc-url $SEPOLIA_RPC_URL \
// --private-key $PRIVATE_KEY \
// --etherscan-api-key $ETHERSCAN_API_KEY \
// --verify \
// src/simple.sol:SimpleToken

// forge create --rpc-url $AURORA_TEST_RPC_URL \
// --private-key $PRIVATE_KEY \
// --verify \
// src/simple.sol:SimpleToken

// forge flatten --output src/simple.flattened.sol src/simple.sol

// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch \
//     --compiler-version v0.8.22+commit.4fc1097e \
//     <the_contract_address> \
//     src/simple.sol:SimpleToken

// forge verify-contract --chain-id 11155111 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop
// forge verify-contract --chain-id 1313161555 --num-of-optimizations 1000000 --watch --compiler-version v0.8.22+commit.4fc1097e 0x5912a392035116C62A40a400e3F54E4523227420 src/lockdrop.sol:LockDrop


// forge verify-contract --chain-id 11155111 --num-of-optimizations 1000000 --watch --compiler-version v0.8.13+commit.abaa5c0e 0xE502649999431584710147eAeA097c941cc9Ee8C src/lockdrop.sol:Counter
