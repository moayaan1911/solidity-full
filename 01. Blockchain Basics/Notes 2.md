<!-- @format -->
## Chapter 1 - Blockchain Basics, Part 2

### Oracle Networks

- Oracles provide external data to blockchains and smart contracts.
- Centralized oracles have a single provider controlling the data.
- Decentralized oracles have multiple independent nodes verifying data.
- Hybrid smart contracts combine blockchain code with off-chain data.

[Introduction to Oracles](https://chain.link/education/blockchain-oracles)

### Centralized Oracle Networks

- Single entity provides the external data to a blockchain.
- Example: Oraclize is a popular centralized oracle service.
- Risk of single point of failure if the provider goes down.
- Must trust the oracle provider to supply accurate data.

[Centralized and Decentralized Oracles](https://medium.com/the-blockchain-presence-blog/what-the-heck-are-centralized-and-decentralized-oracles-simply-explained-bbceaa4588f2)

### Decentralized Oracle Networks

- Decentralized network of nodes retrieve and verify external data.
- Removes single point of failure risk of centralized oracles.
- Data is aggregated from many oracles to increase security.
- Popular examples: Chainlink, Band Protocol, WITNET.

[Decentralized Oracle Networks, Explained](https://medium.com/coinmonks/decentralized-oracle-networks-9fead28f5fe5)

### Hybrid Smart Contracts

- Combine on-chain code with off-chain data and computations.
- Allow complex dapps that exceed blockchain's capabilities.
- Off-chain components can be centralized or decentralized.
- Example: Using an oracle to supply data to an on-chain contract.

[Hybrid Smart Contracts](https://blog.chain.link/hybrid-smart-contracts-explained/)

### Chainlink

- Leading decentralized oracle network that supplies data to blockchains.
- Has a large node operator network to retrieve and verify real-world data.
- Provides secure middleware to connect smart contracts to external data.
- Powers data feeds for DeFi, insurance, gaming, supply chain etc.

[Chainlink Documentation](https://docs.chain.link/)

### EVM Chains

- Blockchains compatible with Ethereum's EVM (Ethereum Virtual Machine).
- Allows Ethereum smart contracts and dApps to be easily ported over.
- Examples include Polygon, Binance Smart Chain, Avalanche, Fantom etc.
- Help scale dApps to more users with faster/cheaper transactions.

[Introduction to EVM Chains](https://www.datawallet.com/crypto/evm-chains#:~:text=Summary%3A%20An%20Ethereum%20Virtual%20Machine,own%20computational%20engine%2C%20the%20EVM.)

### Scalability Problem

- Blockchains face challenges scaling to high transaction volumes and speed.
- On-chain congestion leads to delayed transactions and high fees.
- Proposed solutions include Layer 2 chains, sharding, new consensus models.
- Scalability remains an ongoing challenge as adoption increases.

[Blockchain Scalability Problem](https://www.bitstamp.net/learn/blockchain/what-is-the-blockchain-trilemma/)

### Layer 2 Chains

- Layer 2 solutions are frameworks built on top of base blockchains to improve scalability.
- Transaction data is pushed off-chain, reducing congestion on Layer 1 mainnet.
- Users transact on L2 with much faster and cheaper trades.
- But rely on underlying Layer 1 for security.
- Popular L2 solutions: Optimistic Rollups, ZK Rollups, State Channels, Sidechains.

[Intro to Layer 2 Scaling](https://ethereum.org/en/developers/docs/layer-2-scaling/)

### Optimistic Rollups

- Bundle transactions off-chain and submit only transaction data to mainchain.
- Faster and cheaper since computation is done off-chain.
- Assumes transactions are valid by default (optimistic).
- Has fraud proof mechanism to check for invalid transactions.
- Used by dApp platforms like Arbitrum, Optimism.

[How do Optimistic Rollups Work?](https://research.paradigm.xyz/rollups)

### Zero Knowledge Rollups

- Also bundle transactions off-chain using ZK proofs to verify validity.
- ZK proofs cryptographically prove correctness without revealing data.
- Removes need for fraud proofs like optimistic rollups.
- Provides speed and privacy benefits.
- Used by Loopring, zkSync, Starkware.

[Zero Knowledge Rollups Explained](https://coinmarketcap.com/alexandria/glossary/zero-knowledge-zk-rollups)

### Web 1.0 vs Web 2.0 vs Web 3.0

- **Web 1.0:** Basic static web pages with read-only info. Not very interactive.
- **Web 2.0:** Dynamic interactive web apps, social media, user-generated content.
- **Web 3.0:** Decentralized web powered by blockchain, transparent and user controlled.

[Web 3.0 Explained](https://www.cloudflare.com/en-gb/learning/web3/what-is-web3/)
