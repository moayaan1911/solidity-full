<!-- @format -->
## Chapter 1 - Blockchain Basics

### What is Blockchain

- A blockchain is a decentralized, distributed ledger that records transactions permanently and securely across many computers in a peer-to-peer network.
- Transactions are recorded in "blocks" that are cryptographically linked together in an immutable chain. This makes it very difficult to alter past records or data.
- Blockchains are decentralized - no single entity controls the network. They rely on consensus mechanisms to validate transactions.
- Some key properties of blockchain are transparency, immutability, security and decentralization.

For more details, see this [intro to blockchain](https://www.ibm.com/topics/what-is-blockchain)

### History of Blockchain

- The blockchain concept originated in 1991 when researchers Stuart Haber and W. Scott Stornetta wanted to timestamp digital documents in a way that was tamper-proof.
- In 2008, an anonymous person or group under the name Satoshi Nakamoto published a [whitepaper](https://bitcoin.org/bitcoin.pdf) describing Bitcoin and blockchain.
- The first real-world blockchain was launched in 2009 as the public ledger for Bitcoin transactions.
- Since Bitcoin, many other blockchain implementations have emerged for various uses like Ethereum, Hyperledger, Corda and more.

### Bitcoin

- Bitcoin is a digital currency and payment system that operates via a decentralized blockchain network.
- There will only ever be 21 million Bitcoins in circulation. New coins are "mined" by the network approximately every 10 minutes.
- Bitcoin provides a decentralized way to store and transfer value without any third-party intermediaries.
- As the first application of blockchain technology, Bitcoin is considered "digital gold" and a standard store of value in the crypto space.

For more on Bitcoin, read the [Bitcoin whitepaper](https://bitcoin.org/bitcoin.pdf) and [Bitcoin's history](https://www.investopedia.com/articles/forex/121815/bitcoins-price-history.asp).

### Satoshi Nakamoto

- The creator of Bitcoin published the Bitcoin whitepaper and launched the network under the pseudonym Satoshi Nakamoto in 2008.
- The true identity remains unknown, although there are many theories on who Satoshi might be. Candidates include Nick Szabo, Hal Finney, Craig Wright and others.
- Satoshi was active in the early Bitcoin community until around 2010, then disappeared. He/she/they left the control of the Bitcoin source code and network to early developers and miners.
- It is estimated Satoshi Nakamoto mined over 1 million bitcoins in the early days and owns about 5% of the total Bitcoin supply.

### Bitcoin Whitepaper

- Published October 31, 2008 by Satoshi Nakamoto
- Outlined novel concepts like proof-of-work, decentralized consensus, coin mining and the mechanics of blockchain.
- Proposed Bitcoin as an electronic payment system and "a new kind of money" without centralized trust.
- The Bitcoin whitepaper provided the technical details and framework that allowed the network/currency to be implemented and launched in 2009.
- Read the [original Bitcoin whitepaper](https://bitcoin.org/bitcoin.pdf)

### Vitalik Buterin

- In 2013, 19-year-old programmer Vitalik Buterin proposed Ethereum in a whitepaper.
- Buterin imagined Ethereum as a blockchain-based distributed computing platform for decentralized applications, recognizing limitations with Bitcoin's capabilities.
- He had previously worked on Bitcoin Magazine and a Bitcoin payment system called BitcoinX.
- Buterin has been a leading figure and researcher in the Ethereum development community since its inception.

### Ethereum Whitepaper

- Published in late 2013 by Vitalik Buterin
- Proposed Ethereum as a Turing-complete blockchain network and programming language.
- Outlined key concepts like accounts, smart contracts, gas fees, the Ethereum Virtual Machine, and more that were later implemented.
- The Ethereum whitepaper formed the basis for the Ethereum protocol and dapp development platform we see today.
- Read the original [Ethereum whitepaper](https://github.com/ethereum/wiki/wiki/White-Paper)

### Ethereum

- Ethereum is a decentralized, open-source blockchain featuring smart contract functionality.
- Like Bitcoin, Ethereum has a native cryptocurrency called Ether (ETH) which is used to pay for transactions and computation.
- Ethereum allows developers to build and deploy decentralized applications (dApps).
- Smart contracts are code-based programs that run on the Ethereum blockchain when certain conditions are met.
- Ethereum extends blockchain capabilities beyond simple value transfer like on Bitcoin.

### Decentralized Applications (dApps)

- Dapps are applications built on decentralized networks like blockchains instead of traditional centralized servers.
- They have no central point of control, so no single entity controls the entire application.
- Many dapps operate on the Ethereum network, powered by smart contracts.
- Examples include decentralized finance apps, NFT marketplaces, DAOs, games, social networks and more.

### Smart Contracts

- Self-executing code that runs on the Ethereum blockchain when predetermined conditions are met.
- Enables exchange of money, property, shares or anything without requiring a middleman.
- Ethereum allows developers to write Turing-complete smart contracts, expanding possibilities compared to Bitcoin.
- Smart contracts power most decentralized apps built on Ethereum, like decentralized exchanges, lending apps and NFTs.

### Difference between Bitcoin and Ethereum

| Bitcoin                                    | Ethereum                                             |
| ------------------------------------------ | ---------------------------------------------------- |
| Created for decentralized digital currency | Created for decentralized applications               |
| Basic and limited scripting language       | Turing-complete programming language                 |
| Built for simple value transfers           | Allows complex smart contracts and dapps             |
| Focused on blockchain payments             | General purpose blockchain computing platform        |
| Limited use cases beyond payments          | Many blockchain use cases enabled by smart contracts |

### Bitcoin is Turing Incomplete

- Bitcoin's scripting language has limited functionality.
- No loops or complex conditionals, limiting what Bitcoin scripts can do.
- This makes Bitcoin provably predictable and secure for payments.
- But it restricts Bitcoin's scripting language from being Turing-complete.

### Ethereum is Turing Complete

- Ethereum's programming language is Turing-complete, meaning it has full functionality.
- Ethereum contracts can perform complex operations, loops, lookups, etc enabling many applications.
- Comes at the cost of some determinism for certain operations.
- Allows Ethereum to be a general purpose blockchain development platform.

### The Oracle Problem

- Blockchains cannot access data outside their network (off-chain data) by default.
- Oracles provide a way to connect blockchains to external data needed for contracts.
- Oracles fetch real-world data and transmit it to blockchains and smart contracts.
- Allows smart contracts to execute based on outside conditions and data.
- Example: A flight insurance contract pays out if a flight is delayed. Requires real flight data from an oracle service.

Popular oracle networks include Chainlink, Band Protocol and WITNET.
