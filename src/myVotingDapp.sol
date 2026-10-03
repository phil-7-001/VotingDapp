//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingDapp {
    address owner;
    struct Proposal{
        string name;
        uint256 voteCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;


    constructor(){
        owner = msg.sender; 
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Only Owner");
        _;
        
    }

    event ProposalAdded(uint256 indexed proposalId, string name);
    event Voted(address indexed voter, uint256 indexed proposalId);


    function  _owner() public view returns(address) {
        return owner;
    }

    function  addProposal(string calldata proposalName) external onlyOwner{
        require(bytes(proposalName).length > 0,"Empty Proposal");
        proposals.push(Proposal({name: proposalName, voteCount : 0}));
        emit ProposalAdded(proposals.length - 1, proposalName);
    }


    function vote(uint256 proposalId) public{
        require(proposalId < proposals.length, "Id does not exist");
        require(!hasVoted[msg.sender], "user already voted");

        hasVoted[msg.sender] = true;
        proposals[proposalId].voteCount += 1;
        emit Voted(msg.sender, proposalId);
    }

    function  proposalCount() public view  returns(uint256) {
        return proposals.length;
    }

    function winningProposal() internal view returns(uint256){
        uint256 winningproposal = 0;
        uint256 winningId = 0;
        for(uint i = 0; i < proposals.length; i++) {
            uint256 count = proposals[i].voteCount;
            if(count >=  winningproposal){
                winningproposal = count;
                winningId = i;
            }
        }
        return(winningId);
    }

    function winnerName() public view returns(string memory){
        require(proposals.length > 0, "No Proposals yet");
        return(proposals[winningProposal()].name);
        
    }

} 