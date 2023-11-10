<!-- @format -->
## Chapter 1 - Blockchain Basics, Part 4

### Hash

- A cryptographic hash function takes an input and produces a fixed-size output called a hash value or digest
- Used in blockchains to identify blocks and transactions in a secure way

[Introduction to Cryptographic Hash Functions](https://www.geeksforgeeks.org/introduction-of-cryptography-hash-functions/)

### Block

- In a blockchain, a block contains a batch of transactions to be added to the chain
- Blocks have metadata like a timestamp and reference the hash of the previous block
- This links blocks together chronologically to form the blockchain

[Block (Bitcoin Block)](https://www.investopedia.com/terms/b/block-bitcoin-block.asp)

### Nonce

- An arbitrary number that can only be used once in cryptographic communication
- In blockchain mining, the nonce is incremented to try different hash values to find a valid block
- Helps prove proof-of-work and achieve consensus in blockchains like Bitcoin

[What is a Cryptocurrency Nonce?](https://www.gemini.com/cryptopedia/crypto-nonce-blockchain-meaning)

### Mining

- The process where miners compete to find valid blocks by repeatedly changing the nonce to get different hash values
- Requires massive computing power and energy
- The first miner to find a valid hash is rewarded with newly minted coins

[What is Cryptocurrency Mining?](https://www.investopedia.com/tech/how-does-bitcoin-mining-work/)

### Chain of Blocks

- Blocks in a blockchain contain hashes of previous blocks, linking them chronologically
- This immutable sequencing helps establish tamper-proof consensus
- The chain of connected blocks forms the permanent transaction history

[Blockchain Definition](https://www.investopedia.com/terms/b/blockchain.asp)

### Nodes in a Blockchain

- A node is a computer that connects to a blockchain network to maintain a copy of the ledger
- Nodes store, spread and help validate new blocks across the network
- They allow users to interact with the blockchain like sending transactions

[Nodes Explained](https://www.binance.vision/glossary/node)

### Keccak-256

- Cryptographic algorithm used in Ethereum to hash blocks
- Variation of SHA-3 algorithm, produces 256-bit hashes
- Provides greater protection against attacks than older algorithms

[Keccak 256 Hash Function](https://www.investopedia.com/terms/k/keccak-256.asp)

### SHA-256

- Cryptographic algorithm used in the Bitcoin network to hash blocks
- Produces a 256-bit hash value that can be easily verified but not reversed
- Still considered secure, but may be more vulnerable than newer algorithms

[SHA-256 Hash](https://www.investopedia.com/terms/s/sha-256.asp)
