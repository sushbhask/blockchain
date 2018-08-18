# blockchain

Implementing a simple blockchain in Ruby.

Create a new blockchain like this:
`blockchain = Blockchain.new("this is a string".split(" "))`.

Then, access the blocks like this:
`blockchain.blocks`

Each block will contain it's own content, the hash of the previous block and a nonce generated via proof of work.
