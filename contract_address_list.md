# Deployed contract address list 
    
    - Rewardz = 0xA58889F7C6fc8D407F6B69e15E23fCf194b05Bce
    - Lottery = 0x3E07d0Cf3CE90FF622D64b3F7D3343b8fc5E0776
    - VRFv2Consumer = 0x6D315be97bDE09563779b4558Cf2bB26F3FCdB66
    - TokenManager = 0x50eF9E70dA285ee6321F765997FCd294f0805d36

    - LockDrop = 0x775bDD1CdF9927683d5fCe9588f036BEA1C62074


#       Contract addresses (Utility)
# 
# TokenManager  : 0x50eF9E70dA285ee6321F765997FCd294f0805d36      
# Reward        : 0xA58889F7C6fc8D407F6B69e15E23fCf194b05ce  
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
#          - deploy LockDrop contract                           -- done 
#          - test the RWDZ drop upon withdraw                       -- ToDo   <--  here !! 
#          - display live in front-end                              -- ToDo
#

