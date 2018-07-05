pragma solidity 0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/01_greeter/Greeter.sol";


contract GreeterTest {
  Greeter instance;

  function beforeEach() public {
    instance = new Greeter("Hello, World!");
  }

  function testSayHello() public {
    Assert.equal(instance.sayHello(), "Hello, World!", "incorrect greetings");
  }

  function testSetGreetings() public {
    instance.setGreetings("Hello, Daddy!");
    Assert.equal(instance.sayHello(), "Hello, Daddy!", "incorrect greetings");
  }

  function testSetGreetingsOnlyOwner() public {
    instance = Greeter(DeployedAddresses.Greeter());
    // solium-disable-next-line security/no-low-level-calls
    bool result = address(instance).call(bytes4(keccak256("setGreetings(string)")), "Hello!");
    Assert.equal(result, false, "non-owner can set greetings");
  }
}
