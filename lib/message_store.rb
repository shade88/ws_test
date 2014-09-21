class MessageStore
  #@@messages=[]
  class << self
    attr_accessor :messages
  end
end