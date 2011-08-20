class Tree
  attr_accessor :base_node
  
  def initialize
  end
  
  def add(*values)
    if values.length > 1
      values.each { |val| add(val) }
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





# def randomized(array, factor=1)
#   move = (array.length * factor).floor
#   to_move = []
#   full_random = array.sample(array.length)
#   move.times { to_move << full_random.pop }
#   array = full_random.sort
#   move.times { array.insert(rand(array.length), to_move.pop) }
#   array
# end
# 
# REPEATS = 1
# 
# (1..20).to_a.each do |power|  
#     
#   length = 2**power
#   results = {}
#   
#   REPEATS.times {
#     array = (1..length).to_a
#     array = randomized(array)
# 
#     tree = Tree.new
#     tree.add(array)
#   
#   
#     array.each do |element|
#       depth = tree.path_to(element).length
#       results[depth] ||= 0
#       results[depth] += 1
#     end
#   }
#   
#   average = results.inject(0) { |sum, (k,v)| sum += (k*v.to_f/length) }.to_f / REPEATS
#   
#   # puts "[#{array.length}] #{'%.2f' % factor} => #{'%.2f' % average}"  
#   puts "#{length} = 2^#{power} -- #{average.round}"
# end