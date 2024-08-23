##      Deployed contract address list 

#       Contract addresses (Utility)
#
# LockDrop      : 0x136A1d899c5867a705ff2b28a6Cb4eF08aD87cb7
# TokenManager  : 0xE699e26689E5A1243147e90bA619B480bEc84663
# Reward        : 0x07A8297d53556179448B582b3e939629F5dCC778
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
#   
#   - test the reward tokens drop, upon withdraw         -- #6    
#   - display live in front-end                          -- #7  <-- HERE !!
#
