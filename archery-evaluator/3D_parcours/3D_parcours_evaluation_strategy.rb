require_relative "../evaluation_strategy"
require_relative "../point_map"
require_relative "3D_parcours_console_statistics"

class ParcoursEvaluator
    include EvaluationStrategy

    @@point_map = PointMapModule.create_point_map_from_file("3D_parcours/3D_parcours_point_scale.csv")

    def initialize(presenter: ParcoursConsolePrinter.new)
        @shots = 0
        @score = 0
        @first_hits = 0
        @missed_shots = 0
        @kills = 0
        @life = 0
        @cummulated_score = Array.new
        @scores = Array.new
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
            first_hits: @first_hits, 
            missed: @missed_shots,
            kills: @kills,
            life: @life,
            cummulated: @cummulated_score,
            scores: @scores,
            targets: @scores.size
        }
    end

    def evaluate_shot(shot)
        score_shot(shot)
        handle_missed_shot if @@point_map.missed_shot? shot
        parse_shot(shot) unless @@point_map.missed_shot? shot
    end

private
    def score_shot(shot)
        @score += @@point_map.get_point_definition(shot)
        @cummulated_score.push(@score)
        @scores.push(@@point_map.get_point_definition(shot))
    end

    def handle_missed_shot()
        @shots += 3
        @missed_shots += 1
    end

    def parse_shot(shot)
        shot_class = shot[0]
        shot_count = shot[1].to_i

        @kills += 1 if shot_class.casecmp("K").zero?
        @life += 1 if shot_class.casecmp("L").zero?            
        @first_hits += 1 if shot_count == 1

        @shots += shot_count
    end
end