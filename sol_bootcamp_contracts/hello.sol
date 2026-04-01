// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract SimpleStorage{
    uint256 public favoriteNumber;
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    struct Person{
        string name;
        uint256 my_favorite_number;
    }
    mapping(string => uint256) public nameToFavoriteNumber;//we used map to store the name and the favorite number
    //and to simplify searching by key. The time complexity of mapping is O(1) its constant
    //The better to use mapping is when we want optimized searching when we have a large amount of data
    //we can use array in the case when we have small ammount of data and like if we don't have key value pair at all.
    Person[] public list_of_people;
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    function add_person(string memory _name, uint256 _my_favorite_number) public{
        list_of_people.push(Person(_name,_my_favorite_number));
        nameToFavoriteNumber[_name] = _my_favorite_number;
    }
}