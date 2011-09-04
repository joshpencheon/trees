file = File.dirname(__FILE__) + '/../lib/tree.rb'
puts file
require file

def randomized(array, factor=1)
  move = (array.length * factor).floor
  to_move = []
  full_random = array.sample(array.length)
  move.times { to_move << full_random.pop }
  array = full_random.sort
  move.times { array.insert(rand(array.length), to_move.pop) }
  array
end

REPEATS = 1

(1..20).to_a.each do |power|  
    
  length = 2**power
  results = {}
  
  REPEATS.times {
    array = (1..length).to_a
    array = randomized(array)

    tree = Tree.new
    tree.add(array)
  
  
    array.each do |element|
      depth = tree.path_to(element).length
      results[depth] ||= 0
      results[depth] += 1
    end
  }
  
  average = results.inject(0) { |sum, (k,v)| sum += (k*v.to_f/length) }.to_f / REPEATS
  
  # puts "[#{array.length}] #{'%.2f' % factor} => #{'%.2f' % average}"  
  puts "#{length} = 2^#{power} -- #{average.round}"
end