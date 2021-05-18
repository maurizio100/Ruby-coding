require_relative "../statistics_presentation_strategy"

class ParcoursConsolePrinter
    include PresentationStrategy

    def perform_statistic_presentation(statistics)
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

end