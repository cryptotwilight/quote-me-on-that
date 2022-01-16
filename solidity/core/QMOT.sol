// SPDX-License-Identifier: Apache 2.0

pragma solidity >=0.8.0 <0.9.0;

import "../interfaces/IQMOT.sol";

contract QMOT is IQMOT { 

    
    mapping(address=>address[]) addressBookAddressesByUserAddress; 
    mapping(address=>mapping(address=>string)) nameByAddressByUserAddress; 

    mapping(address=>mapping(address=>Message[])) messagesByRecepientByUserAddress; 

    struct Message{ 
        address sender; 
        address reciever; 
        string cid; 
        uint256 sentTime; 
    }

    constructor() { 

    }

    function getAddressBook() override view external returns (string [] memory _names, address [] memory _addresses){
        _addresses = addressBookAddressesByUserAddress[msg.sender];
        _names = new string[](_addresses.length);
        for(uint256 x = 0; x < _addresses.length; x++) {
            _names[x] = nameByAddressByUserAddress[msg.sender][_addresses[x]];    
        }
        return (_names, _addresses);
    }

    function getMessages(address _recipient) override view external returns (string [] memory _cidList, uint256 [] memory _sentTimes, address [] memory _senders){
        Message [] memory messages_ = messagesByRecepientByUserAddress[msg.sender][_recipient];
        _cidList = new string[](messages_.length);
        _sentTimes = new uint256[](messages_.length);
        _senders = new address[](messages_.length);
        for(uint256 x = 0; x < messages_.length; x++) {
            Message memory message_ = messages_[x];
            _cidList[x] = message_.cid; 
            _senders[x] = message_.sender; 
            _sentTimes[x] = message_.sentTime;
        }
        return (_cidList, _sentTimes, _senders);
    }

    function addAddress(string memory _name, address _address) override external returns (bool _added){
        addressBookAddressesByUserAddress[msg.sender].push(_address);
        nameByAddressByUserAddress[msg.sender][_address] = _name; 
        return true; 
    }

    function sendMessage(address _recipient, string memory _cid) override external returns (uint256 _sentTime){
        _sentTime = block.timestamp; 
        Message memory message_ = Message({
                                    sender : msg.sender,
                                    reciever : _recipient,
                                    cid : _cid,
                                    sentTime : _sentTime
                                });
        messagesByRecepientByUserAddress[msg.sender][_recipient].push(message_);
        messagesByRecepientByUserAddress[_recipient][msg.sender].push(message_);
        return _sentTime; 
    }

}