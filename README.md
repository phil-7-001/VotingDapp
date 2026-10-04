# VotingDapp

A simple decentralized voting smart contract built with **Solidity** and **Foundry**.

The project implements an on-chain proposal and voting system where the contract owner can create proposals, while each address is allowed to vote once. Vote counts are stored directly on the blockchain and the proposal with the highest vote count can be retrieved.

## Features

* Owner-controlled proposal creation
* Add proposals with a name
* Prevent empty proposal names
* Allow users to vote for a proposal
* Prevent an address from voting more than once
* Store proposal vote counts on-chain
* Retrieve the total number of proposals
* Determine the winning proposal
* Retrieve the name of the winning proposal
* Emit events when proposals are added and votes are cast

## Technologies

* **Solidity ^0.8.0**
* **Foundry**
* **Ethereum Virtual Machine (EVM)**
* **Git & GitHub**

## How It Works

### 1. Contract Ownership

When the contract is deployed, the address that deploys it becomes the owner.

```solidity
constructor() {
    owner = msg.sender;
}
```

Only the owner can add new proposals.

### 2. Adding Proposals

The owner can create a proposal using:

```solidity
addProposal(string calldata proposalName)
```

The contract checks that the proposal name is not empty before adding it to the `proposals` array.

Each proposal contains:

```solidity
struct Proposal {
    string name;
    uint256 voteCount;
}
```

### 3. Voting

Users vote by providing the ID of the proposal they want to support:

```solidity
vote(uint256 proposalId)
```

The contract checks:

* That the proposal exists.
* That the caller has not already voted.

Each address can therefore vote **once per deployed contract**.

### 4. Determining the Winner

The contract compares the vote count of every proposal and identifies the proposal with the highest number of votes.

The winning proposal's name can be retrieved with:

```solidity
winnerName()
```

If two or more proposals have the same highest vote count, the proposal with the **highest proposal ID** is returned because the comparison uses `>=`.

## Events

The contract emits two events.

### ProposalAdded

```solidity
event ProposalAdded(
    uint256 indexed proposalId,
    string name
);
```

This is emitted whenever the owner successfully adds a proposal.

### Voted

```solidity
event Voted(
    address indexed voter,
    uint256 indexed proposalId
);
```

This is emitted whenever a user successfully votes.

## Project Structure

```text
VotingDapp/
├── src/
│   └── VotingDapp.sol
├── test/
│   └── VotingDapp.t.sol
├── script/
│   └── ...
├── foundry.toml
└── README.md
```

> The project contains an additional test file under the `test/` directory.

## Getting Started

### Prerequisites

You need:

* Git
* Foundry
* An Ethereum-compatible development environment

### Clone the Repository

```bash
git clone https://github.com/phil-7-001/VotingDapp.git
cd VotingDapp
```

### Build the Contract

```bash
forge build
```

### Run Tests

Run the complete test suite with:

```bash
forge test
```

For more detailed output:

```bash
forge test -vv
```

For even more detailed traces:

```bash
forge test -vvvv
```

## Example Workflow

After deploying the contract:

### Step 1 — Add proposals

The owner can add proposals such as:

```text
Alice
Bob
Charlie
```

### Step 2 — Users vote

Users call:

```solidity
vote(0)
```

or

```solidity
vote(1)
```

or

```solidity
vote(2)
```

depending on the proposal they want to support.

### Step 3 — Check the winner

The winning proposal can be retrieved using:

```solidity
winnerName()
```

## Key Solidity Concepts Demonstrated

This project demonstrates practical use of several Solidity concepts:

* Contracts
* Constructors
* State variables
* Structs
* Dynamic arrays
* Mappings
* Modifiers
* Access control
* `msg.sender`
* `calldata`
* Events
* `require`
* `view` functions
* Internal functions
* Loops
* On-chain state management

## Limitations

This project is a learning implementation and does not attempt to provide all the requirements of a production-grade voting system.

For example, the current implementation does not include:

* A voting start or end time
* A mechanism for registering eligible voters
* Vote delegation
* Vote weighting
* Proposal removal
* Proposal modification
* Emergency controls
* A frontend interface
* Privacy-preserving voting

The `hasVoted` mapping also means an address can vote only once for the entire lifetime of the deployed contract, rather than once per individual election.

## Future Improvements

Possible improvements include:

* Adding a voting period
* Allowing multiple elections
* Adding voter registration
* Building a frontend with wallet integration
* Deploying to an Ethereum testnet
* Adding more comprehensive automated tests
* Improving access-control mechanisms
* Adding election states such as `NotStarted`, `Active`, and `Ended`

## Testing

The project includes automated tests written using Foundry.

The tests are used to verify the behavior of the voting contract, including proposal creation, voting restrictions, vote counting, and winner determination.

Run all tests with:

```bash
forge test
```

## Security Notice

This project is intended for educational purposes and has not been professionally audited.

It should not be used to conduct real-world elections without substantial additional development, security review, testing, and consideration of election-specific requirements.

## Author

**Phil**

GitHub:
https://github.com/phil-7-001
