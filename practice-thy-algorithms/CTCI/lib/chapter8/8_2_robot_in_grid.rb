=begin

    8.2 Robot In A Grid

    Imagine a robot sitting on the upper left corner of grid with r rows and c columns.
    The robot can only move in two directions, right and down, but certain cells are "off limits"
    such that the robot cannot step on them. Design an algorithm to find a path for the robot from
    the top left to the bottom right.

=end

require "byebug"

MOVES = {
    right: [0, 1],
    down: [1, 0]
}

def robot_in_a_grid(grid, path = [], cur_pos = [0,0])
    return [] if grid[grid.length-1][grid[0].length-1] != ''        # checks if bottom right is open
    return [] unless valid_move?(grid, cur_pos)                         # checks if location is blocked
    return [] if grid[cur_pos[0]][cur_pos[1]] != ''                 # checks if space is blocked
    # puts "--------------------"
    # print cur_pos
    # puts ""
    # print path
    # puts ""
    # puts "--------------------"
    
    
    if cur_pos == [grid.length-1, grid[0].length-1]                 # returns when robot is at bottom right
        return path 
    end
    MOVES.each do |key, value|
        # byebug
        pos = [cur_pos[0]+value[0], cur_pos[1]+value[1]]
        temp_path = path.dup
        temp_path << key
        # if valid_move?(grid, pos)
            temp_path = robot_in_a_grid(grid, temp_path, pos)
            path = temp_path if path.length < temp_path.length
        # end
    end

    path
end

def valid_move?(grid, pos)
    (pos_x, pos_y) = pos

    return false if (grid.length-1) < pos_x
    return false if (grid[0].length-1) < pos_y

    true
end


def generate_grid(row, col, bombs)
    grid = Array.new(row) { Array.new(col, '') }

    until bombs == 0
        temp_row = rand(row)
        temp_col = rand(col)

        if grid[temp_row][temp_col] == ''
            grid[temp_row][temp_col] = "X"
            bombs -= 1
        end
    end
    grid
end

def print_grid(grid)
    grid.each do |rows|
        print rows
        print "\n"
    end
end

grid = generate_grid(3, 3, 2)
puts "-------------------------"
print_grid(grid)
puts "-------------------------"
print robot_in_a_grid(grid)
