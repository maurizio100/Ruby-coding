module ArcherModule
    def process_archer_scores(score_line, score_evaluation)
        scores = score_line.split(',')
        name = scores.shift
        archer = Archer.new(name, score_evaluation)

        scores.each { |shot| archer.evaluate_shot(shot.strip) }
        return archer
    end

    module_function :process_archer_scores
end

class Archer
    attr_reader :name

    def initialize(name, score_card)
        @name = name
        @score_card = score_card
    end

    def get_statistics()
        @score_card.get_statistics
    end

    def evaluate_shot(shot)
        @score_card.evaluate_shot(shot)
    end
end
