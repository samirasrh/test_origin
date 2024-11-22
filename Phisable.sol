pragma solidity ^0.6.4;

//Example from the Mastering Ethereum book
// Version of Solidity compiler this program was written for

contract Phishable {
    address public owner;

    constructor (address _owner) {
        owner = _owner;
    }

    function () external payable {} // collect ether

    function withdrawAll(address _recipient) public {
        require(tx.origin == owner);
        _recipient.transfer(this.balance);
    }
}
