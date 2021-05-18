require_relative "point_map"
require_relative "archer"

def print_statistics(archer)
    statistics = archer.get_statistics
    
    puts
    puts "================== #{statistics[:name]} =================="
    puts "Score: #{statistics[:score]}"
    puts "Shots: #{statistics[:shots]}"
    puts "Targets: #{statistics[:targets]}"
    puts "Kills: #{statistics[:kills]}"
    puts "Lifes: #{statistics[:life]}"
    puts "First hits: #{statistics[:first_hits]}"
    puts "Missed targets: #{statistics[:missed]}"
    puts
    
end

points_file = "points.csv"
scores_file = "scores_poertschach_17052021.csv"

point_map = PointMapModule.create_point_map_from_file(points_file)
archers = Array.new
File.foreach(scores_file) { |line| archers.push(ArcherModule.process_archer_scores(line, point_map)) }

puts "--------------------------------------------------------------------------------------"
archers.each { |archer| print_statistics archer}
puts "--------------------------------------------------------------------------------------"