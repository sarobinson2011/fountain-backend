##      Deployed contract address list 

#       Contract addresses (Utility)
#
# TokenManager  : 
# Reward        : 
# LockDrop      : 
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
#   - deploy the Reward contract                         -- #1
#   - deploy the TokenManager contract                   -- #2
#   - import reward token into Metamask                  -- #3
#   - call TokenManager:setRewardTokenAddress()          -- #4 
#   - deploy LockDrop contract                           -- #5 
#   - call TokenManager:setLockDropAddress()             -- #6
#   - call TokenManager:topUpFtn()                       -- #7
#   
#
#   - test the reward tokens drop, upon withdraw         --    
#   - display live in front-end                          --
#
