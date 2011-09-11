require 'node'

class Tree
  attr_accessor :base_node
  
  def initialize
  end
  
  def rehang!
    values = nodes.map(&:value)
    self.base_node = nil
    rehang_array(values)
    true
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
  
  private
  
  def rehang_array(array)
    centre = (array.length.to_f / 2).floor
    sorted_array = array.sort

    add(sorted_array.at(centre))
    
    left_array  = sorted_array.slice(0, centre)
    right_array = sorted_array.slice(centre + 1, sorted_array.length - 1)
    
    rehang_array(left_array)  unless left_array.length.zero?
    rehang_array(right_array) unless right_array.length.zero?
  end
end