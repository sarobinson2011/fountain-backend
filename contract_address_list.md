##      Deployed contract address list 

#       App address for front-end
#
# LockDrop      : 0x8eA5DFF5ee126a9497185249b91f6790F1325bbE

#       Contract addresses (Utility)
# 
# TokenManager  : 0x2761EF18De0018A2fEF0EEE16F85A8Fa59401822       
# Reward        : 0xc18b35F67fe20606E61353f0A0a2332b08bD5872
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
#   - test the reward tokens drop, upon withdraw         -- #6    <-- HERE !!
#   - display live in front-end                          -- #7
#

