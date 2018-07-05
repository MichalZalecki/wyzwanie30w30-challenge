pragma solidity 0.4.24;


contract BalanceAndAddress {
  address internal owner;

  constructor() public payable {
    owner = msg.sender;
  }

  function getContractAddress() public view returns (address) {
    return address(this);
  }

  function getOwnerAddress() public view returns (address) {
    return owner;
  }

  function getSenderAddress() public view returns (address) {
    return msg.sender;
  }

  function getContractBalance() public view returns (uint256) {
    return address(this).balance;
  }

  function getOwnerBalance() public view returns (uint256) {
    return owner.balance;
  }

  function getSenderBalance() public view returns (uint256) {
    return msg.sender.balance;
  }
}
