# frozen_string_literal: true

def knight(start, finish)
  move({}, start, 0, finish)
end

def move(memory, curr_field, moves, target)
  field_x, field_y = calculate_coords curr_field

  if target == curr_field
    solution_fields = []
    solution_fields.push curr_field
    return solution_fields
  end

  memory[curr_field] = moves
  possible_moves = calculate_possible_moves(field_x, field_y)

  moves += 1

  solution_fields = []
  part_fields = []

  possible_moves.each do |x, y|
    next unless field_of_interest(x, y, memory, moves)

    next_field = calculate_field_name x, y
    part_fields = move(memory, next_field, moves, target)

    next if part_fields.empty?

    if solution_fields.empty? || solution_fields.length > part_fields.length
      solution_fields = part_fields
      solution_fields.push curr_field
    end
  end

  solution_fields
end

def calculate_possible_moves(coord_x, coord_y)
  possible_moves = []
  possible_moves.push [coord_x - 1, coord_y + 2]
  possible_moves.push [coord_x - 2, coord_y + 1]
  possible_moves.push [coord_x - 2, coord_y - 1]
  possible_moves.push [coord_x - 1, coord_y - 2]
  possible_moves.push [coord_x + 1, coord_y + 2]
  possible_moves.push [coord_x + 2, coord_y + 1]
  possible_moves.push [coord_x + 2, coord_y - 1]
  possible_moves.push [coord_x + 1, coord_y - 2]
  possible_moves
end

def field_of_interest(coord_x, coord_y, memory, moves)
  return false if coord_x <= 0 || coord_x > 8 || coord_y <= 0 || coord_y > 8

  field_name = calculate_field_name(coord_x, coord_y)
  field = memory[field_name]

  field.nil? || moves < field
end

def calculate_coords(field)
  [(field[0].ord - 'a'.ord) + 1, (field[1].ord - '1'.ord) + 1]
end

def calculate_field_name(coord_x, coord_y)
  field_letter = ((coord_x - 1) + 'a'.ord).chr
  field_letter + coord_y.to_s
end

print 'Enter Start Field:'
start = gets.chomp

print 'Enter Target Field:'
target = gets.chomp

solution = knight(start, target)

solution.each do |f|
  print "| #{f} | "
end

puts
