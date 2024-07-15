# Deployed contract address list 
    
    - Rewardz = 0x89Af2fc384D9ecC8Ac6efa8F79CAc33837F78588
    - Lottery = 0x3E07d0Cf3CE90FF622D64b3F7D3343b8fc5E0776
    - VRFv2Consumer = 0x6D315be97bDE09563779b4558Cf2bB26F3FCdB66
    - TokenManager = 0x311cF9EDE117CdDEBBb5EF3b9B9A03C5D3652D1B

    - LockDrop = 0xeaFFe8fE602766eb23e66C81F627eC35F0D9D89c


#       Contract addresses (Utility)
# 
# TokenManager  : 0x311cF9EDE117CdDEBBb5EF3b9B9A03C5D3652D1B      
# Reward        : 0x89Af2fc384D9ecC8Ac6efa8F79CAc33837F78588  
# 

#       Contract addresses (Functionality)
#
# VRFv2Consumer : 0x6D315be97bDE09563779b4558Cf2bB26F3FCdB66    
# Lottery       : 0x3E07d0Cf3CE90FF622D64b3F7D3343b8fc5E0776    
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
#          - call TokenManager:setRewardTokenAddress()            -- ToDo #4 
#          - deploy LockDrop contract                             -- ToDo #3 
#          - test the RWDZ drop upon withdraw                     -- ToDo #5  
#          - display live in front-end                            -- ToDo #6
#

