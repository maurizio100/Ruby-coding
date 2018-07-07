class LinkedList

	@head = nil	

	def add(value)
		if @head.nil?
			@head = Node.new(value)
		else
			successor = @head
			while !successor.next.nil?
				successor = successor.next
			end
			successor.next = Node.new(value)
		end
	end

	def show()
		successor = @head
		while !successor.nil?
			print "[ #{successor.value} ] "
			successor = successor.next
		end
		puts
	end

	class Node
		def initialize(value)
			@value = value
		end

		attr_accessor :next
		attr_reader :value
	end
end

