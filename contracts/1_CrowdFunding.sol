// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
 
contract CrowdFunding {
    // Variables de estado
    uint256 public id;
    string public name;
    string public desc;
    address payable public author;
    bool public isActive;
    uint public funds;
    uint public fundraisingGoal;

    constructor(uint256 _id, string memory _name, string memory _desc, uint _fundraisingGoal) {
        id = _id;
        name = _name;
        desc = _desc;
        author = payable(msg.sender);
        isActive = true;
        funds = 0;
        fundraisingGoal = _fundraisingGoal;
    }

    // modificador de funciones
    modifier onlyAuthor() {
        require(msg.sender == author,"Only author can access to this function");
        _;
    }

    modifier onlyNotAuthor() {
        require(msg.sender != author,"Only not author address can access to this function");
        _;
    }

    function fundProject() public onlyNotAuthor payable  {
        author.transfer(msg.value);
        funds += msg.value;
    }   

    function changeProjectState(bool _isActive) public onlyAuthor {
        isActive = _isActive;
    }
}