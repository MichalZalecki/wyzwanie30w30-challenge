pragma solidity 0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../../contracts/02_balance_and_address/BalanceAndAddress.sol";


contract BalanceAndAddressTest {
  BalanceAndAddress instance;

  uint256 public initialBalance = 1 ether;

  function beforeEach() public {
    instance = BalanceAndAddress(DeployedAddresses.BalanceAndAddress());
  }

  function testGetContractAddress() public {
    Assert.equal(instance.getContractAddress(), address(instance), "contract address is incorrect");
  }

  function testGetOwnerAddress() public {
    // solium-disable-next-line security/no-tx-origin
    Assert.equal(instance.getOwnerAddress(), tx.origin, "owner address is incorrect");
  }

  function testGetSenderAddress() public {
    Assert.equal(instance.getSenderAddress(), address(this), "sender address is incorrect");
  }

  function testGetContractBalance() public {
    instance = (new BalanceAndAddress).value(0.1 ether)();
    Assert.equal(instance.getContractBalance(), 0.1 ether, "contract balance is incorrect");
  }

  function testGetOwnerBalance() public {
    // solium-disable-next-line security/no-tx-origin
    Assert.equal(instance.getOwnerBalance(), tx.origin.balance, "owner balance is incorrect");
  }

  function testGetSenderBalance() public {
    Assert.equal(instance.getSenderBalance(), address(this).balance, "sender balance is incorrect");
  }
}
