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
      @tree.base_node.value.must_equal('added value!')
    end
    
  end
  
  describe "with many values added" do
    
    before(:each) do
      values = (1..10).to_a.sample(10)
      @tree.add(*values)
    end
    
    it "should return paths to each value" do
      
    end
    
    it "should return nil when tracing an element it doesn't contain" do
      @tree.path_to(11).must_be_nil
    end
    
  end
end