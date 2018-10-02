# frozen_string_literal: true

# An example implementation of a LinkedList
# it is able to add values and show them
class LinkedList
  @head = nil

  def add(value)
    if @head.nil?
      @head = Node.new(value)
    else
      successor = @head
      successor = successor.next until successor.next.nil?
      successor.next = Node.new(value)
    end
  end

  def show
    successor = @head
    until successor.nil?
      print "[ #{successor.value} ] "
      successor = successor.next
    end
    puts
  end
end

# A simple datastructure holding a a value for a datastructure
class Node
  def initialize(value)
    @value = value
  end

  attr_accessor :next
  attr_reader :value
end
