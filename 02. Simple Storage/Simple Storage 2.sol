// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] private persons;

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        persons.push(Person(_favouriteNumber, _name));
    }

    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < persons.length, "Index out of bounds");
        return persons[index];
    }
}
