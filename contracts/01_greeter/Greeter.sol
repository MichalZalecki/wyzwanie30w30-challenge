pragma solidity 0.4.24;


contract Greeter {
  address public owner;
  string internal greetings;

  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _;
  }

  constructor(string _greetings) public {
    owner = msg.sender;
    setGreetings(_greetings);
  }

  function setGreetings(string _greetings) public onlyOwner returns (bool) {
    greetings = _greetings;
  }

  function sayHello() public view returns (string) {
    return greetings;
  }
}
