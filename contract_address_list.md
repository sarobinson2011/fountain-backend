##      Deployed contract address list 

#       Contract addresses (Utility)
#
# LockDrop      : 0x8EF66EF1D1988aCe7E557CDE98f67Fb3c18Cd2D2
# TokenManager  : 0x7aedE1ceF21bF80574aD9339c63745Ef138219C6  
# Reward        : 0xB688bbAF1239b560eCd6B56d7fAd4719D75CB7e1
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


