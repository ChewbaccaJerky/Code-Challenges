


# 
# Your last Python code is saved below:
# # Write a function to build a valid minesweeper board given width, height, 
# # and number of mines. (If you're not familiar with Minesweeper, check the 
# # explanation in the comments after generateBoard())
# 
# # Example input:
# # width = 7
# # height = 4
# # numberOfMines = 4
# 
# # Example of valid output:
# # [[1*21000],
# #  [23*1011],
# #  [*21101*],
# #  [2100011]]
# 
# 
# # Every tile on a minesweeper board is either a mine (denoted by *) or a number. 
# # A non-mine tile shows a number, denoting how many mines are in the 8  tiles 
# # adjacent to it (vertically, horizontally, and diagonally). 
# 
# # An example of a 3x3 board: generateBoard(3, 3, 4)
# 
# #   * 3 *
# #   1 4 * 
# #   0 2 *
# 
# 

# Step 1 create board
# Step 2 place random mines on board
# Step 3 Iterate each tile skipping mines
    # Step 3a When it's not a mine count adjacent mines
        # then set counted mines to value

#   *  -1  *
#  -1  -1  *
#  -1  -1  *

# Step 3a
# cur_pos = [0, 1]
# check within bounds and count mines
# [[x-1], [y-1..y+1]]  = top values
# [[x, y-1], [x, y+1]] = middle values
# [[x+1], [y-1..y+1]]  = bottom

# after couting set counted mines to tile


def generateBoard(row, col, num_mines)
# Step 1 create board
  board = Array.new(row) { Array.new(col) {-1}}
# Step 2 place random mines on board
  until num_mines < 1
    temp_x = rand(row)
    temp_y = rand(col)
    
    if board[temp_x][temp_y] != "*"
      board[temp_x][temp_y] = "*" 
      num_mines -= 1  
    end
  end
    
# Step 3 Iterate each tile skipping mines
  board.each_index do |x|
    board.each_index do |y|
      next if board[x][y] == "*"
      count = 0
    # Step 3a
    # check within bounds and count mines
      x = [x-1, x+1]
      y = [y-1, y+1]
       
      (min_x..max_x).each do |x|
        (min_y..max_y).each do |y|
          if (x >= 0 && x < row) && (y >= 0 && y < col)
            count += 1 if board[x][y] == "*"
          end
        end
      end
      # Step 3b Add count to tile
      board[x][y] = count
    end
  end
  
  # Step 4 Return value
  board
end

# board = generateBoard(3, 3, 4)
board = generateBoard(3, 3, 8)

board.each do |row|
  print row
  print "\n"
end
