class Archer
    def initialize(name)
        @name = name
        @shots = 0
        @score = 0
        @first_hits = 0
        @missed_shots = 0
        @kills = 0
        @life = 0
        @cummulated_score=Array.new
        @scores=Array.new
    end

    def get_statistics()
        return { 
            name: @name, 
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

    def evaluate_shot(shot, point_map)
        score_shot(shot, point_map)

        handle_missed_shot if point_map.missed_shot? shot
        parse_shot(shot) unless point_map.missed_shot? shot
    end

private
    def score_shot(shot, point_map)
        @score += point_map.get_point_definition(shot)
        @cummulated_score.push(@score)
        @scores.push(point_map.get_point_definition(shot))
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

module ArcherModule
    def process_archer_scores(score_line, point_map)
        scores = score_line.split(',')
        name = scores.shift
        archer = Archer.new(name)

        scores.each { |shot| archer.evaluate_shot(shot.strip, point_map) }
        return archer
    end

    module_function :process_archer_scores
end