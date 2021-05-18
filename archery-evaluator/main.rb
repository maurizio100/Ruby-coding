require_relative "point_map"
require_relative "archer"
require_relative "standard/standard_evaluation_strategy"
require_relative "3D_parcours/3D_parcours_evaluation_strategy"

def print_statistics(archer)
    statistics = archer.get_statistics
    
    puts
    puts "================== #{archer.name} =================="
    puts "Score: #{statistics[:score]}"
    puts "Shots: #{statistics[:shots]}"
#   puts "Targets: #{statistics[:targets]}"
#    puts "Kills: #{statistics[:kills]}"
#    puts "Lifes: #{statistics[:life]}"
#    puts "First hits: #{statistics[:first_hits]}"
    puts "Missed targets: #{statistics[:missed]}"
    puts
    
end

archers = Array.new
scores_file = "3D_parcours/3D_parcours_poertschach_17052021.csv"
#scores_file = "standard/standard.csv"

File.foreach(scores_file) { |line| archers.push(ArcherModule.process_archer_scores(line, ParcoursEvaluator.new)) }

puts "--------------------------------------------------------------------------------------"
archers.each { |archer| print_statistics archer}
puts "--------------------------------------------------------------------------------------"