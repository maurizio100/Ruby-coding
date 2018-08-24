def knight(start, finish)
  move_list = move({}, start, 0, finish)	
end

def move(memory, curr_field, moves, target)
  field_x, field_y = calculate_coords curr_field

  if target == curr_field
    solution_fields = Array.new
    solution_fields.push curr_field
    return solution_fields
  end

  memory[curr_field] = moves
  possible_moves = calculate_possible_moves(field_x, field_y)	

  moves += 1

  solution_fields = Array.new
  part_fields = Array.new
  
  possible_moves.each do |x, y|
    if field_of_interest(x, y, memory, moves)
      next_field = calculate_field_name x, y			
      part_fields = move(memory, next_field, moves, target)
      
      if !part_fields.empty?
	if solution_fields.empty? || solution_fields.length > part_fields.length
          solution_fields = part_fields
          solution_fields.push curr_field
        end
      end      
    end
  end

  return solution_fields
end

def calculate_possible_moves(x, y)
  possible_moves = Array.new	
  possible_moves.push [x-1, y+2]
  possible_moves.push [x-2, y+1]
  possible_moves.push [x-2, y-1]
  possible_moves.push [x-1, y-2]
  possible_moves.push [x+1, y+2]
  possible_moves.push [x+2, y+1]
  possible_moves.push [x+2, y-1]
  possible_moves.push [x+1, y-2]

  return possible_moves
end

def field_of_interest(x, y, memory, moves)
  if x <= 0 || x > 8 || y <= 0 || y > 8
    return false
  end
  
  field_name = calculate_field_name x, y
  field = memory[field_name]
  
  return field == nil || moves < field
end

def calculate_coords(field)	
  [(field[0].ord - 'a'.ord) + 1, (field[1].ord - '1'.ord) + 1]
end

def calculate_field_name(x, y)
  field_letter = ((x-1) + 'a'.ord).chr
  field_letter + y.to_s
end

print "Enter Start Field:"
start = gets.chomp

print "Enter Target Field:"
target = gets.chomp

solution = knight(start, target)

solution.each do |f|	
  print "| #{f} | "
end

puts

