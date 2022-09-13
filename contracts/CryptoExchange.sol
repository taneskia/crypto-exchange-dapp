// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

struct Address {
    string name;
    address payable _address;
}

contract CryptoExchange {

    mapping (address => Address[]) addressMap;

    event EtherSent(address from, address to);

    function sendEther(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        emit EtherSent(msg.sender, _to);
    }

    function saveAddress(string memory name, address payable _to) public returns(Address[] memory) {
        addressMap[msg.sender].push(Address(name,_to));
        return addressMap[msg.sender];
    }

    function getAddressList() public view returns(Address[] memory) {
        return addressMap[msg.sender];
    }
    
}