##      Deployed contract address list 

#       Contract addresses (Utility)
#
# LockDrop      : 0x639E1684c506c56B8bc9B914A3742bCB9196b4F3
# TokenManager  : 0x2c3c29a0A7B72d2951a5270d959F7C5C8DeD3cBc
# Reward        : 0x3879d5dA031fB5F7B65Be7d00b5e6e2312D55eaC
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
#   - deploy the TokenManager contract                   -- #1
#   - deploy the Reward contract                         -- #2
#   - import reward token into Metamask                  -- #3
#   - call TokenManager:setRewardTokenAddress()          -- #4 
#   - deploy LockDrop contract                           -- #5 
#   
#   - test the reward tokens drop, upon withdraw         -- #6    
#   - display live in front-end                          -- #7  <-- HERE !!
#
