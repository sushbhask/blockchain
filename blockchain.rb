require("./block.rb")

class BlockChain
  attr_accessor :blocks

  def initialize(array)
    self.blocks = []
    previous_hash = ""
    array.each_with_index do |content, i|
      if i === 0
        # genesis block
        block = Block.new(content, nil)
        previous_hash = block.do_work
      else
        block = Block.new(content, previous_hash)
        previous_hash = block.do_work
      end
      self.blocks.push(block)
    end
  end
end
