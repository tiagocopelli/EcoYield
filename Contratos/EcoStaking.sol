// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./EcoToken.sol";
import "./EcoBadge.sol";

contract EcoStaking is ReentrancyGuard {
    EcoToken public stakingToken;
    EcoBadge public nftBadge;

    uint256 public rewardRate = 100; // Tokens por bloco (ajustável pela DAO)
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public lastUpdateBlock;

    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);

    constructor(address _token, address _nft) {
        stakingToken = EcoToken(_token);
        nftBadge = EcoBadge(_nft);
    }

    function stake(uint256 _amount) external nonReentrant {
        require(_amount > 0, "Quantidade precisa ser maior que zero");
        
        _mintRewards(msg.sender);
        
        stakingToken.transferFrom(msg.sender, address(this), _amount);
        stakedBalance[msg.sender] += _amount;
        lastUpdateBlock[msg.sender] = block.number;

        emit Staked(msg.sender, _amount);
    }

    function withdraw() external nonReentrant {
        uint256 amount = stakedBalance[msg.sender];
        require(amount > 0, "Nao ha tokens em stake");

        _mintRewards(msg.sender);

        stakedBalance[msg.sender] = 0;
        stakingToken.transfer(msg.sender, amount);
        
        emit Withdrawn(msg.sender, amount);
    }

    function _mintRewards(address _user) internal {
        uint256 multiplier = block.number - lastUpdateBlock[_user];
        uint256 reward = stakedBalance[_user] * rewardRate * multiplier / 1e18;

        if (reward > 0) {
            stakingToken.mint(_user, reward);
            emit RewardPaid(_user, reward);
        }
    }
}
