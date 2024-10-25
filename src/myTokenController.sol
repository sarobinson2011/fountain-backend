// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract MyTokenController {
    address public owner;
    address public myTokenAddress;

    event NewApproval(address _spender, uint256 _amount);
    event Allowance(address _owner, address _spender, uint256 _allowance);
    event TransferFrom(address _from, address _to, uint256 _amount);
    event TotalSupply(uint256 _supply);
    event BalanceOf(uint256 _balanceOf);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed...");
        _;
    }

    function setMyTokenAddress(address _myTokenAddress) external onlyOwner {
        myTokenAddress = _myTokenAddress;
    }

    function totalSupply() external {
        uint256 _supply = IERC20(myTokenAddress).totalSupply();
        emit TotalSupply(_supply);
    }

    // function totalSupply() external returns (uint256) {
    //     uint256 supply = IERC20(myTokenAddress).totalSupply();      // added _tokenAddress argument #ToDo
    //     emit TotalSupply(supply);
    //     return supply;
    // }

    function balanceOf(address _account) external {
        uint256 _balanceOf = IERC20(myTokenAddress).balanceOf(_account);
        emit BalanceOf(_balanceOf);
    }
    
    function transfer(address _to, uint256 _amount) external {
        require(IERC20(myTokenAddress).transfer(_to, _amount), "MYT transfer failed...");
    }

    function approve(uint256 _amount) external {
        require(IERC20(myTokenAddress).approve(address(this), _amount), "Failed to approve MYT for spend");
        emit NewApproval(address(this), _amount);
    }

    function allowance() external {
        uint256 _allowance = IERC20(myTokenAddress).allowance(msg.sender, address(this));
        emit Allowance(msg.sender, address(this), _allowance);
    }

    function transferFrom(address _to, uint256 _amount) external {
        require(IERC20(myTokenAddress).transferFrom(address(this), _to, _amount), "transferFrom() failed");  
        emit TransferFrom(address(this), _to, _amount);
    }
}

