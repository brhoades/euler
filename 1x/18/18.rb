require 'awesome_print'
# https://projecteuler.net/problem=18

class Node
  attr_accessor :parents

  def initialize(data, parents)
    @parents = parents
    @data = data
  end

  def to_str
    @data.to_s
  end

  def to_int
    @data.to_i
  end
end

class Tree
  attr_accessor :root, :lastnodes

  def initialize(file)
    data = File.read(file).split("\n").map { |e| e.split(' ').map { |i| i.to_i } }
    @lastnodes = [ ] # abused on reading, stores our last level node list

    # Populate the tree from top down, so we don't waste space with children entries
    data.each do |level|
      thisnodes = [ ]
      if level.size == 1
        @root = Node.new(level[0], [nil])
        @lastnodes << @root
        next
      end

      level.size.times.each do |i|
        left = @lastnodes[i-1] unless i == 0
        right = @lastnodes[i]
        thisnodes << Node.new(level[i], [ left, right ].compact)
      end

      @lastnodes = thisnodes
    end

    @lastnodes
  end
end

# this effectively compares the passed node's parents' parents'... nth parents sum.
# It branches out up to a total depth of the passed depth argument.
#
#TODO: cache calculated parent values at each node... this may include storing "best"
#paths. Alternatively, use a pathfinding algorithm.
def largestParentSum( node, depth )
  depth -= 1

  if node != nil 
    sum = node.to_int
  else
    return 0
  end

  if depth <= 0
    return sum
  end
  
  if node.parents.size == 1
    sum + largestParentSum( node.parents.first, depth )
  else
    sum + [ largestParentSum( node.parents.first, depth ), largestParentSum( node.parents.last, depth ) ].max
  end
end

tree = Tree.new ARGV[0]
depth = ARGV[1].to_i

sum = 0
node = nil
largestsum = -1
# choose the start node--- node with the largest parent sum within depth
tree.lastnodes.each do |n|
  tsum = largestParentSum( n, depth )
  if tsum > largestsum
    largestsum = tsum
    node = n
  end
end

# Now walk up and choose nodes by doing sums with a diminishing depth of depth
while node != nil
  sum += node.to_int
  if node.parents.size > 1
    lsize = largestParentSum( node.parents.first, depth )
    rsize = largestParentSum( node.parents.last, depth )
    if lsize > rsize
      node = node.parents.first
    else
      node = node.parents.last
    end
  else
    node = node.parents.first
  end
end

print sum
