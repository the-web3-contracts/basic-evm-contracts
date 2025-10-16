## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
forge script ./script/FundingManageScript.s.sol:FundingManageScript --rpc-url https://rpc.roothashpay.com --private-key 0x5cee86cfac9b46271055a89bd872e0dd6c3764f71354f790d151ab210e7c10ec --broadcast
```

### Cast

```shell
cast code 0x58A70808048285AA5EE83018BFa9233942b6f841 --rpc-url https://rpc.roothashpay.com

cast call --rpc-url https://rpc.roothashpay.com  0x58A70808048285AA5EE83018BFa9233942b6f841 "supportToken(address)(bool)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE

cast send --rpc-url https://rpc.roothashpay.com --private-key 0x5cee86cfac9b46271055a89bd872e0dd6c3764f71354f790d151ab210e7c10ec 0x58A70808048285AA5EE83018BFa9233942b6f841 "setSupportToken(address,bool)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE true


```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
