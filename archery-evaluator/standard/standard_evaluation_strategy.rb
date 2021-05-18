require_relative "../evaluation_strategy"
require_relative "../point_map"
require_relative "standard_console_statistics"

class StandardEvaluator
    include EvaluationStrategy
    
    @@point_map = PointMapModule.create_point_map_from_file("standard/standard_point_scale.csv")

    def initialize(presenter: StandardConsolePrinter.new)
        @shots = 0
        @score = 0
        @cummulated_score = Array.new
        @scores = Array.new
        @missed_shot = 0
        @statistics_presenter = presenter
    end
    
    def present_statistics(name)
        @statistics_presenter.perform_statistic_presentation(get_statistics(name))
    end

    def get_statistics(name)
        return { 
            name: name,
            shots: @shots,
            score: @score, 
            cummulated: @cummulated_score,
            scores: @scores,
            missed: @missed_shot
        }
    end

    def evaluate_shot(shot)
        score_shot shot
        handle_missed_shot if @@point_map.missed_shot? shot
        parse_shot unless @@point_map.missed_shot? shot
    end

private
    def score_shot(shot)
        @score += @@point_map.get_point_definition(shot)
        @cummulated_score.push(@score)
        @scores.push(@@point_map.get_point_definition(shot))
    end

    def handle_missed_shot()
        @missed_shots += 1
        @shots += 1
    end

    def parse_shot()
        @shots += 1
    end
end