// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./EcoToken.sol";

contract EcoGovernance {
    EcoToken public token;
    
    struct Proposal {
        string description;
        uint256 voteCount;
        bool executed;
        mapping(address => bool) hasVoted;
    }

    Proposal[] public proposals;
    uint256 public constant VOTE_THRESHOLD = 1000 * 10**18; // Mínimo de votos para aprovar

    constructor(address _token) {
        token = EcoToken(_token);
    }

    function createProposal(string memory _description) external {
        Proposal storage newProposal = proposals.push();
        newProposal.description = _description;
    }

    function vote(uint256 _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(!proposal.hasVoted[msg.sender], "Ja votou");
        
        uint256 weight = token.getPastVotes(msg.sender, block.number - 1);
        require(weight > 0, "Sem poder de voto");

        proposal.voteCount += weight;
        proposal.hasVoted[msg.sender] = true;
    }
}



