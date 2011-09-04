require 'node'

class Tree
  attr_accessor :base_node
  
  def initialize
  end
  
  def add(*values)
    if values.length > 1
      values.map { |val| add(val) }
    else
      if base_node
        base_node.hang(values.first)
      else
        self.base_node = Node.new(values.first)
      end
    end
  end
  
  def path_to(value)
    if base_node
      path = base_node.find(value).flatten
      path.last.nil? ? nil : path
    else
      nil
    end
  end
  
  def nodes
    if base_node
      [base_node] + base_node.child_nodes
    else
      []
    end
  end
  
  def print
    # puts "Tree has #{nodes.length} nodes"
    # puts "  (#{nodes.select(&:leaf?).length} leaves)"
    if base_node
      base_node.print
    else
      puts '[empty]'
    end
  end
end