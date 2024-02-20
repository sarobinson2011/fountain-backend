# 1. TokenManager implementation        <-- done (✓, ×)
    - Deploy TokenManager                                       ✓
    - Deploy Reward                                             ✓
    - call TokenManager:transferReward(msg.sender, 100)         ✓ 

# 2. LockDrop implementation            <-- done 
    - call deposit{value: 1 ether}()
    - add Reward token contract address to MetaMask, so the RWDZ tokens are recognised
    - wait 5 mins
    - call withdraw()
    - confirm RWDZ (100,000) were transferred   <--   must be able to test this programmatically !
  
# 3. FrontEnd interface #1              <-- done
    - connect wallet button                                     ✓
    - deposit button (with hard-coded 0.01 ether)               ✓
    - withdraw button                                           ✓
    - deposit button (with user input amount)                   ✓   
    - deposit button (with amount as an argument + check)       ✓
    - withdraw button (with user input ?)                       ✓
    - check it all works on Aurora Testnet                      ✓

# 4. FrontEnd interface #2              <-- in progress...
    - Learn how to display emitted events (in the browser)      ×       <-- HERE !!
    - Display the address of the connected wallet               ×
    - Learn how to control element(s) location on page          ×
    - Use the emit event --> display event on the page          ×
  
# 5. Backend functionality              <-- ToDo
    - Rewardz token calculation for the drop + implement        ×
