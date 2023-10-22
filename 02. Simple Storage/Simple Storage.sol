// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

contract SimpleStorage {

  uint256 favouriteNumber;

  function setFavouriteNumber(uint256 _x) public {
    favouriteNumber = _x;
  }

  function getFavouriteNumber() public view returns (uint256){
    return favouriteNumber;
  }

}