# 1. TokenManager implementation        <-- done (✓, ×)
    - Deploy TokenManager                                   ✓
    - Deploy Reward                                         ✓
    - call TokenManager:transferReward(msg.sender, 100)     ✓ 



# 2. LockDrop implementation            <-- done 
    - call deposit{value: 1 ether}()
    - add Reward token contract address to MetaMask, so the RWDZ tokens are recognised
    - wait 5 mins
    - call withdraw()
    - confirm RWDZ (100,000) were transferred   <--   must be able to test this programmatically !
  

# 3. FrontEnd interface                 <-- in progress
    - connect wallet button                                 ✓
    - deposit button (with hard-coded 0.01 ether)           ✓
    - withdraw button                                       ×
    - deposit button (with user input amount)               ×