module PointMapModule
    def create_point_map_from_file(file)
        point_map = PointMap.new
        
        File.foreach(file) do |line| 
            splitted_line = line.split(',')
            point_map.add_point_definition(splitted_line[0], splitted_line[1].to_i)
        end
    
        return point_map
    end

    module_function :create_point_map_from_file
end

class PointMap
    def initialize()
        @points=Hash.new
    end

    def add_point_definition(shot, point)
        @points[shot] = point
    end

    def get_point_definition(shot)
        return 0 if missed_shot? shot
        @points[shot]
    end

    def missed_shot?(shot)
        !@points.include? shot
    end
end
