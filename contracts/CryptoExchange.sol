// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract CryptoExchange {

    function sendEther(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
    
}