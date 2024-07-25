##      Deployed contract address list 

#       Contract addresses (Utility)
#
# LockDrop      : 0x73451dF16b339f2523d959326e0EA7B6A76e0263
# TokenManager  : 0x19c68c600CB47b53e9609DE123bccc2E40A9B880       
# Reward        : 0x1645422d1f02fc09CcA7af48ea30cA2bF5F4F25E 
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
#   - test the reward tokens drop, upon withdraw         -- #6    
#   - display live in front-end                          -- #7  <-- HERE !!
#

