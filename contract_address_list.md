##      Deployed contract address list 

#       Contract addresses (Utility)
#
# TokenManager  : 0xe8c02A1b4c93C0AF0eB6eb1767Da3de80af7B302
# Reward        : 0x0caE28846187A0111eeA8e31Cd251Bb95ADa692E
# LockDrop      : 0x31A10D4c514c769Eb21b02400c5DF3b914cc54A1
# 

#       Contract addresses (Functionality)
#
# VRFv2Consumer : 0x6D315be97bDE09563779b4558Cf2bB26F3FCdB66 ?   
# Lottery       : 0x3E07d0Cf3CE90FF622D64b3F7D3343b8fc5E0776 ?   
#

#       Actions to perform

#   - deploy the Reward contract                         -- #1  
#   - deploy the TokenManager contract                   -- #2
#   - call TokenManager:setRewardTokenAddress()          -- #4
#   - call TokenManager:setTokenManagerAddress()         -- #5
#   - deploy LockDrop contract                           -- #6 

#   - test TokenManager (ERC-20) functions as working?   -- #9      <-- HERE !!
#


#    transfer(address _to, uint256 _amount) external;                           - done
#    approve(address _spender, uint256 _amount) external;                       - done 
#    transferFrom(address _from, address _to, uint256 _value) external;         - done 
#    allowance(address _owner, address _spender) external returns(uint256);     - done
#    balanceOf(address _account) external returns (uint256);                    - done
#    totalSupply() external returns (uint256);                                  - done



# *** Aurora Testnet ***  -->  this works!
# 
# forge script script/deploy_lockdrop.s.sol:Deploy --rpc-url ${AURORA_TEST_RPC_URL} --broadcast --legacy --verify -vv --etherscan-api-key ${AURORA_API_KEY} --verifier blockscout --verifier-url ${AURORA_API} --private-key ${PRIVATE_KEY}


