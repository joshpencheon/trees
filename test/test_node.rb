require 'test_helper'

describe Node do

  before(:each) do
    @node = Node.new(rand)
  end
  
  it "should be a node" do
    @node.class.must_equal Node
  end
  
end