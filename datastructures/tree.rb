class Tree

  def add(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.add(value)
    end
  end

  def tree_values
    tree_values = @root.get_values
  end  
end

class Node

  def initialize(value)
    @value = value
  end
  
  def add(value)
    if @value > value      
      if @left.nil?
        @left = Node.new(value)
      else
        @left.add(value)
      end
    else
      if @right.nil?
        @right = Node.new(value)
      else
        @right.add(value)
      end
    end
  end

  def get_values
    values = []

    values << @left.get_values unless @left.nil?
    values << @value
    values << @right.get_values unless @right.nil?

    return values
  end
end


mytree = Tree.new
mytree.add(3)
mytree.add(2)
mytree.add(10)
mytree.add(5)
mytree.add(6)
mytree.add(1)


values = mytree.tree_values
puts "#{values}"
