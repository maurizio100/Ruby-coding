# frozen_string_literal: true

require './linkedlist_impl'

mylist = LinkedList.new
(1...10).each { |i| mylist.add(i) }

mylist.show
puts '$LOAD_PATH ($:)'
