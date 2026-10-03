//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// import "forge-std/Test.sol";
// import "../src/votingDApp.sol";

// contract VotingDAppTest is Test {
//     VotingDApp public voting; 
//     address public owner = address(0x1);
//     address public voter1 = address(0x2);
//     address public voter2 = address(0x3);

//     function setUp() public {
//         vm.prank(owner);
//         voting = new VotingDApp();
//     }

//     function testAddProposal() public {
//         vm.prank(owner);
//         voting.addProposal("Proposal A");

//         assertEq(voting.proposalCount(), 1);

//         (string memory name, uint256 votes) = voting.proposals(0);
//         assertEq(name, "Proposal A");
//         assertEq(votes, 0);
//     }

//     function testVote() public {
//         vm.prank(owner);
//         voting.addProposal("Proposal A");

//         vm.prank(voter1);
//         voting.vote(0);

//         (, uint256 votes) = voting.proposals(0);
//         assertEq(votes, 1);
//     }

//     function testCannotVoteTwice() public {
//         vm.prank(owner);
//         voting.addProposal("Proposal A");

//         vm.prank(voter1);
//         voting.vote(0);

//         vm.prank(voter1);
//         vm.expectRevert(bytes("ALREADY_VOTED"));
//         voting.vote(0);
//     }

//     function testWinningProposal() public {
//         vm.prank(owner);
//         voting.addProposal("Proposal A");
//         voting.addProposal("Proposal B");

//         vm.prank(voter1);
//         voting.vote(0);

//         vm.prank(voter2);
//         voting.vote(1);

//         assertEq(voting.winningProposal(), 0);
//         assertEq(voting.winnerName(), "Proposal A");
//     }
// }
