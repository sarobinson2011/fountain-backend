##      Deployed contract address list 

#       Contract addresses (Utility)
#
# TokenManager  : 0x6fA792653BDf612B12156781142020952585fDDD
# Reward        : 0x990c4cDACEd8CcEcD158BB940C029A37f08a6cc8
# LockDrop      : 0xb3E84f2D80246eEB6677F69f391Ca5FCd6A70cA0
# 

#       Contract addresses (Functionality)
#
# VRFv2Consumer : 0x6D315be97bDE09563779b4558Cf2bB26F3FCdB66 ?   
# Lottery       : 0x3E07d0Cf3CE90FF622D64b3F7D3343b8fc5E0776 ?   
#

#       Actions to perform
# 
# TokenManager:setRewardTokenAddress()   -- done
# VRFv2Consumer:setLotteryContract()     -- done
# Lottery:setTokenManager()              -- done     
# Lottery:setVrfConsumer()               -- done
#
#  
#   - deploy the TokenManager contract                   -- #1
#   - deploy the Reward contract                         -- #2
#   - import reward token into Metamask                  -- #3
#   - call TokenManager:setRewardTokenAddress()          -- #4 
#   - deploy LockDrop contract                           -- #5 
#   - call TokenManager:setLockDropAddress()             -- #6
#   
#   - test the reward tokens drop, upon withdraw         -- #7    
#   - display live in front-end                          -- #8  <-- HERE !!
#
