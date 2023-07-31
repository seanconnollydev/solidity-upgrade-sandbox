## Solidity Upgrade Sandbox

A sandbox repository for setting up and testing Solidity upgrade scenarios using Foundry.

## Usage

### Test

```shell
# All tests
$ forge test

# Specific contract
$ forge test -vv  --mc ChangeVariableOrder_V2
```

## Scenarios

### Change Variable Order

```solidity
contract ChangeVariableOrder_V1 is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public number;

    /* ... */
}

contract ChangeVariableOrder_V2 is UUPSUpgradeable, OwnableUpgradeable {
    uint256 public slotShifter; // Adding this variable shifts the storage slot of `number` in the proxy
    uint256 public number;

    /* ... */
}
```

Test Results:

```bash
[FAIL. Reason: Assertion failed.] testCurrentNumber() (gas: 26989)
Logs:
  Error: a == b not satisfied [uint]
        Left: 0
       Right: 99

[FAIL. Reason: Assertion failed.] testIncrement() (gas: 48247)
Logs:
  Error: a == b not satisfied [uint]
        Left: 1
       Right: 100

[PASS] testSetNumber(uint256) (runs: 256, μ: 32790, ~: 33723)
[FAIL. Reason: Assertion failed.] testSlotStorage() (gas: 26966)
Logs:
  Error: a == b not satisfied [uint]
        Left: 99
       Right: 0
```
