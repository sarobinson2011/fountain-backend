# Deployed contract address list 
    
    - Rewardz = 0x9226fe7f6e64E44a84b90cAC43562Fe0ad4A7Cf9
    - Lottery = 0x3E07d0Cf3CE90FF622D64b3F7D3343b8fc5E0776
    - VRFv2Consumer = 0x6D315be97bDE09563779b4558Cf2bB26F3FCdB66
    - TokenManager = 0x311cF9EDE117CdDEBBb5EF3b9B9A03C5D3652D1B

    - LockDrop = 0x775bDD1CdF9927683d5fCe9588f036BEA1C62074


#       Contract addresses (Utility)
# 
# TokenManager  : 0x311cF9EDE117CdDEBBb5EF3b9B9A03C5D3652D1B      
# Reward        : 0x9226fe7f6e64E44a84b90cAC43562Fe0ad4A7Cf9  
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
# LockDrop - rewrite calculateReward() to drip 0.5 per block    -- done
#          - deploy the TokenManager contract                       -- ToDo #1
#          - deploy the Reward contract                             -- ToDo #2
#          - deploy LockDrop contract                               -- ToDo #3 
#          - call TokenManager:setRewardTokenAddress()              -- ToDo #4  
#    -->   - test the RWDZ drop upon withdraw                       -- ToDo #5  <--
#          - display live in front-end                              -- ToDo #6
#

