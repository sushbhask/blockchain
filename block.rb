class Block
  attr_accessor :content
  attr_accessor :previous_hash
  attr_accessor :nonce
  WORK_FACTOR = 3

  def initialize(content, previous_hash)
    self.content = content
    self.previous_hash = previous_hash
  end

  def do_work
    nonce, hash = mint("#{previous_hash}#{content}")
    self.nonce = nonce
    return hash
  end

  def mint(challenge)
    loop do
      nonce = SecureRandom.hex(10)
      hash = hash(challenge, nonce)
      if hash[0..WORK_FACTOR - 1] === "0" * WORK_FACTOR
        broken = true
        return nonce, hash
      end
    end
  end

  def hash(challenge, nonce)
    return Digest::SHA2.hexdigest("#{challenge}#{nonce}")
  end
end
