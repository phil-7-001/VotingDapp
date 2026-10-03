//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "../src/myVotingDapp.sol";

contract votingDappTest is Test{


    VotingDapp public voting;
    address public owner = address(0x1);
    address public voter1 = address(0x2);
    address public voter2 = address(0x3);

    function setUp() external{
        vm.prank(owner);
        voting = new VotingDapp();
    }

    function testOwner() public view {
        assertEq(voting._owner(), owner);
    }

    function testAddProposal() public{
        vm.prank(owner);
        voting.addProposal("Proposal A");
        assertEq(voting.proposalCount(), 1);

        (string memory name, uint256 votes) = voting.proposals(0);
        assertEq(name, "Proposal A");
        assertEq(votes, 0); 
    }

    function testVote() public{
        vm.prank(owner);
        voting.addProposal("Proposal A");

        vm.prank(voter1);
        voting.vote(0);
        (, uint256 voteCount) = voting.proposals(0);
        assertEq(voteCount, 1);
    }   
    

    function testCannotVoteTwice() public{
        vm.prank(owner);
        voting.addProposal("Proposal A");

        vm.startPrank(voter1);
        voting.vote(0);
        bool hasVoted = voting.hasVoted(voter1);
        assertEq(hasVoted, true);


        vm.expectRevert();
        voting.vote(0);
        vm.stopPrank();
    }
}