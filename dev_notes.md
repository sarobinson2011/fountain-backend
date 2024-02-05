# 1. TokenManager implementation        <-- done (✓, ×)
    - Deploy TokenManager                                   ✓
    - Deploy Reward                                         ✓
    - call TokenManager:transferReward(msg.sender, 100)     ✓



# 2. LockDrop implementation            <-- in progress 
    - call deposit{value: 1 ether}()
    - add Reward token contract address to MetaMask, so the RWDZ tokens are recognised
    - wait 5 mins
    - call withdraw()
    - confirm RWDZ (100,000) were transferred   <--   must be able to test this programmatically !
  