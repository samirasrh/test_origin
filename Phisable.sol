pragma solidity ^0.6.4;

//Example from the Mastering Ethereum book
// Version of Solidity compiler this program was written for

contract Phishable {
    address public owner;

    constructor (address _owner) public  {
        owner = _owner;
    }

    fallback () external payable {} // collect ether

    function withdrawAll(address payable _recipient) {
        require(tx.origin == owner);
        _recipient.transfer(address(this).balance);
    }
}
