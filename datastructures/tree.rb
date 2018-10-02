# frozen_string_literal: true

# an example implementation of a tree
class Tree
  def add(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.add(value)
    end
  end

  def tree_values
    @root.get_values
  end
end

# a simple container that stores a value used for datastructures
class Node
  def initialize(value)
    @value = value
  end

  def add(value)
    if @value > value
      @left.nil? ? Node.new(value) : @left.add(value)
    else
      @right.nil? ? Node.new(value) : @right.add(value)
    end
  end

  def values
    values = []

    values << @left.get_values unless @left.nil?
    values << @value
    values << @right.get_values unless @right.nil?

    values
  end
end
