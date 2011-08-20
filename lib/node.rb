class Node
  attr_accessor :value, :nodes
  
  def initialize(value, parent=nil)
    self.value = value
    self.nodes = {}
    self.nodes[:parent] = parent
  end
  
  def left_node
    nodes[:left]
  end
  
  def right_node
    nodes[:right]
  end
  
  def parent_node
    nodes[:parent]
  end
  
  def child_nodes
    list = [ ]
    list << left_node << left_node.child_nodes if left_node
    list << right_node << right_node.child_nodes if right_node
    list.flatten    
  end
  
  def find(value)
    hang(value, true)
  end
  
  def base_node?
    parent_node.nil?
  end
  
  def leaf?
    !(left_node || right_node)
  end
    
  def hang(value, searching = false)
    return nil if searching && leaf? && (self.value != value)
        
    case self.value <=> value
    when 1 
      searching ? [self.value, left_node && left_node.hang(value, true)] : add(:left, value)
    when 0
      searching ? [self.value] : self
    when -1
      searching ? [self.value, right_node && right_node.hang(value, true)] : add(:right, value)
    end
  end
  
  def print(indent = '')
    left_node.print(indent + '  ') if left_node
    puts indent + value.to_s
    right_node.print(indent + '  ') if right_node
  end
  
  def inspect
    "<#Node value=#{value}>"
  end
  
  private 
  
  def add(position, value)
    if nodes[position]
      nodes[position].hang(value)
    else
      nodes[position] = Node.new(value, self)
    end
  end
end