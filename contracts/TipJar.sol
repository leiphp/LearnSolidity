// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TipJar {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier  onlyOwner() {
        require(msg.sender == owner, "Yor are not owner");
        _;
    }

    function tip() public payable {
        require(msg.value > 0, "You should send a tip user this function");
    }

    function withdraw() public onlyOwner {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "There are no tips to withdraw");
        payable(owner).transfer(contractBalance);
    }

    function getBalance() public onlyOwner view returns (uint256) {
        return address(this).balance;
    }
}