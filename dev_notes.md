# 1. TokenManager implementation        <-- done (✓, ×)
    - deploy TokenManager                                       ✓
    - deploy Reward                                             ✓
    - call TokenManager:transferReward(msg.sender, 100)         ✓ 

# 2. LockDrop implementation            <-- done 
    - call deposit{value: 1 ether}()
    - add Reward token contract address to MetaMask
    - wait 5 mins
    - call withdraw()
    - confirm RWDZ (100,000) were transferred   
  
# 3. FrontEnd interface #1              <-- done
    - connect wallet button                                     ✓
    - deposit button (with hard-coded 0.01 ether)               ✓
    - withdraw button                                           ✓
    - deposit button (with user input amount)                   ✓   
    - deposit button (with amount as an argument + check)       ✓
    - withdraw button (with user input ?)                       ✓
    - check it all works on Aurora Testnet                      ✓

# 4. FrontEnd interface #2              <-- in progress...
    - learn how to display emitted events (in the console)      ✓       
    - display emitted events (on the page)                      ✓         
    - display the address of the connected wallet               ✓
    - learn how to control element(s) location on page          ✓
  
# 5. Backend functionality              <-- in progress...
    - emit and detect RewardTransferred event                   ✓
    - bug in the deposit/withdraw logic                         ✓
    - rewardz token calculation for the drop + implement        ×       
      - use Chainlink to inject randomness to the drop          ×

