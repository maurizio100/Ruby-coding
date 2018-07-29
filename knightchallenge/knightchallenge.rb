def knight(start, finish)
	move_list = move({}, start, 0, finish)	
end

def move(memory, curr_field, moves, target)
	field_x, field_y = calculate_coords curr_field
	moves += 1

	if target == curr_field
		puts "Solution found with #{moves} move(s)"
		solution_fields = Array.new
		solution_fields.push curr_field
		return solution_fields
	end

	memory[curr_field] = moves
	possible_moves = caluclate_possible_moves(memory, field_x, field_y, moves)	
	
	if !possible_moves.empty?	
		solution_fields = Array.new
		part_fields = Array.new
		
		possible_moves.each do |x, y|
			next_field = calculate_field_name x, y			
			part_fields = move(memory, next_field, moves, target)
			if !part_fields.empty?
			
			end		
		end
	end

	return Array.new
end

def calculate_possible_moves(memory, field_x, field_y)
	possible_moves = Array.new	
	(x-1, y+2);
	(x-2, y+1);
	(x-2, y-1);
	(x-1, y-2);
	(x+1, y+2);
	(x+2, y+1);
	(x+2, y-1);
	(x+1, y-2);
	
	return possible_moves
end

def calculate_coords(field)	
	[
		(field[0].ord - 'a'.ord) + 1,
		(field[1].ord - '1'.ord) + 1		
	]
end

def calculate_field_name(x, y)
	field_letter = ((x-1) + 'a'.ord).chr
	field_letter + y.to_s
end


solution = knight('a1', 'a1')

solution.each do |f|	
	print "| #{f} | "
end

puts


