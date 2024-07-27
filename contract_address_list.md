##      Deployed contract address list 

#       Contract addresses (Utility)
#
# LockDrop      : 0x31Af5DE31e5B4A7826B2926B5349D12C815762BF
# TokenManager  : 0xAfb04620B1BFAC4a59d141FDe8C79B3B075f79B0       
# Reward        : 0x6B4127F62E5d15DbE754441bD4dF79c71273996a
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

