// SPDX-License-Identifier: Apache 2.0

pragma solidity >=0.8.0 <0.9.0;

interface IQMOT { 

    function getAddressBook() view external returns (string [] memory _names, address [] memory _addresses);

    function getMessages(address _recipient) view external returns (string [] memory _cidList, uint256 [] memory _sentTimes, address [] memory senders);

    function sendMessage(address _recipient, string memory cid) external returns (uint256 _sentTime);

    function addAddress(string memory _name, address _address) external returns (bool _added);

}