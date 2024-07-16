##      Deployed contract address list 

#       App address for front-end
#
# LockDrop      : 

#       Contract addresses (Utility)
# 
# TokenManager  : 0xEbD2Ce933eA2AcF319E0636A04736fA64449c3C8      
# Reward        :  
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
# LockDrop - rewrite calculateReward() to drip 0.5 per block  -- done
#          - deploy the TokenManager contract                     -- ToDo #1
#          - deploy the Reward contract                           -- ToDo #2
#          - import reward token into Metamask                    -- ToDo #3
#          - call TokenManager:setRewardTokenAddress()            -- ToDo #4 
#          - deploy LockDrop contract                             -- ToDo #5 
#          - test the reward tokens drop, upon withdraw           -- ToDo #6  
#          - display live in front-end                            -- ToDo #7
#

