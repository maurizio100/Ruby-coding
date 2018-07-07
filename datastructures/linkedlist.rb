require './linkedlist_impl'

mylist = LinkedList.new()
(1...10).each do |i|
	mylist.add(i)
end

mylist.show()
puts "$LOAD_PATH ($:)"
