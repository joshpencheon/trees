require 'test_helper'

describe Node do

  before(:each) do
    @node = Node.new(5)
  end
  
  it "should initially return nil for its nodes" do
    @node.left_node.must_be_nil
    @node.right_node.must_be_nil
    @node.parent_node.must_be_nil
  end
  
  it "should have no child_nodes" do
    @node.child_nodes.must_be_empty
  end
  
  it "should be a leaf without any nodes" do
    @node.leaf?.must_equal true
  end
    
  describe "when hanging nodes" do
    
    before(:each) do
      @smaller_node = @node.hang(3)
      @larger_node  = @node.hang(7)
    end
    
    it "should not be a leaf" do
      @node.leaf?.must_equal false
    end
  
    it "should return the new node when hanging a different value" do
      @smaller_node.class.must_equal Node
      @smaller_node.value.must_equal 3
    end
    
    it "should set the parent_node correctly" do
      @smaller_node.parent_node.must_equal @node
      @larger_node.parent_node.must_equal @node      
    end
    
    it "should hang values left/right appropriately" do
      @node.left_node.must_equal @smaller_node
      @node.right_node.must_equal @larger_node
    end
    
    describe "in a recursive way" do
      
      before(:each) do
        @node.hang(2)
        @node.hang(4)
        @node.hang(6)
        @node.hang(8)                        
      end
      
      it "should properly hang from its nodes" do
        @smaller_node.left_node.value.must_equal 2
        @smaller_node.right_node.value.must_equal 4        
        @larger_node.left_node.value.must_equal 6
        @larger_node.right_node.value.must_equal 8        
      end
      
      it "should not be the parent node of all nodes" do
        @smaller_node.left_node.parent_node.must_equal @smaller_node
      end
      
    end
    
  end  
  
end