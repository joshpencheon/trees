require 'test_helper'

describe Tree do

  before(:each) do
    @tree = Tree.new
  end

  it "should have no base node" do
    @tree.base_node.must_be_nil
    @tree.nodes.must_be_empty
  end
  
  it "should accept multiple values at once" do
    @tree.add(1,2,3)
    @tree.nodes.length.must_equal 3
  end
  
  describe "having had a single value added" do
    
    before(:each) do
      @tree.add('added value!')
    end
    
    it "should have the base node with that value" do
      @tree.base_node.wont_be_nil
      @tree.base_node.value.must_equal 'added value!'
    end
    
  end
  
  describe "with many values added" do
    
    before(:each) do
      values = [3,5,1,7,9,2,4,6,8]
      @tree.add(*values)
    end
    
    describe "when finding values" do
      
      it "should return the path nested value" do
        @tree.path_to(9).must_equal [ 3, 5, 7, 9 ]
      end
      
      it "should return an array with just the base_node value" do
        @tree.path_to(3).must_equal [ 3 ]
      end

      it "should return nil when tracing a value it doesn't contain" do
        @tree.path_to(10).must_be_nil
      end    
      
    end
      
  end
end