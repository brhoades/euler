require 'awesome_print'
# https://projecteuler.net/problem=18

class Node
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
  @root = nil
  attr_accessor :root

  def initialize(file)
    data = File.read(file).split("\n").map { |e| e.split(' ').map { |i| i.to_i } }
    @lastnodes = [ ] # abused on reading, stores our last level node list

    # Populate the tree from top down, so we don't waste space with children entries
    data.each do |level|
      thisnodes = [ ]
      if level.size == 1
        @root = Node.new(level[0], nil)
        @lastnodes << @root
        next
      end

      level.size.times.each do |i|
        thisnodes << Node.new(level[i], [ @lastnodes[i/2], @lastnodes[(i+1)/2] ])
      end

      @lastnodes = thisnodes
    end

    @lastnodes
  end
end

Tree.new ARGV[0]

print Tree.root
