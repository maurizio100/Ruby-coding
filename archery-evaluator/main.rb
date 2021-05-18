require_relative "point_map"
require_relative "archer"
require_relative "standard/standard_evaluation_strategy"
require_relative "3D_parcours/3D_parcours_evaluation_strategy"


archers = Array.new
#scores_file = "3D_parcours/3D_parcours_poertschach_17052021.csv"
scores_file = "standard/standard.csv"

File.foreach(scores_file) do |line| 
    participant = ArcherModule.process_archer_scores(line, StandardEvaluator.new)
    archers.push(participant) 
end

puts "--------------------------------------------------------------------------------------"
archers.each { |archer| archer.present_statistics }
puts "--------------------------------------------------------------------------------------"