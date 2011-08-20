class Node
  attr_accessor :value, :parent_node, :left_node, :right_node
  
  def initialize(value)
    self.value = value
  end
  
  def child_nodes
    nodes = [ self ]
    nodes << left_node.child_nodes if left_node
    nodes << right_node.child_nodes if right_node
    nodes.flatten    
  end
  
  def find(value)
    hang(value, true)
  end
  
  def leaf?
    !(left_node || right_node)
  end
    
  def hang(value, searching = false)
    return nil if searching && leaf? && (self.value != value)
        
    case self.value <=> value
    when -1 
      searching ? [self.value, left_node && left_node.hang(value, true)] : add_left(value)
    when 0
      searching ? [self.value] : self
    when 1
      searching ? [self.value, right_node && right_node.hang(value, true)] : add_right(value)
    end
  end
  
  def print(indent = '')
    left_node.print(indent + '  ') if left_node
    puts indent + value.to_s
    right_node.print(indent + '  ') if right_node
  end
  
  private 
  
  def add_left(value)
    if left_node
      left_node.hang(value)
    else
      self.left_node = Node.new(value)
    end
  end
  
  def add_right(value)
    if right_node
      right_node.hang(value)
    else
      self.right_node = Node.new(value)
    end
  end
end