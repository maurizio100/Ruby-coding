require_relative "../statistics_presentation_strategy"

class StandardConsolePrinter
    include PresentationStrategy

    def perform_statistic_presentation(statistics)
        puts
        puts "================== #{statistics[:name]} =================="
        puts "Score: #{statistics[:score]}"
        puts "Shots: #{statistics[:shots]}"
        puts "Missed targets: #{statistics[:missed]}"
        puts
    end
    
end