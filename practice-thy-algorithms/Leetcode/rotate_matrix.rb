# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
# rule (x,y) -> (y, max-x)
def rotate(matrix)
    # print matrix
    max = matrix[0].length-1
    matrix.each.with_index do |arr, i|
        arr.each.with_index do |num, j|
           matrix[j][max-i] = [num, matrix[j][max-i]]
        end
    end
    
    print matrix
    
    matrix.each.with_index do |arr, i|
        arr.each.with_index do |num, j|
            matrix[i][j] = num[0]
        end
    end
    
    print matrix
end

def rotate_in_place(mat)
    max = mat.length
    x = 0
    while x < mat.length / 2
        y = x

        while y < mat.length - 1
            # store current cell in temp variable
            temp = mat[x][y];

            # move left to top
            mat[x][y] = mat[y][x]

            # move bottom to left
            # mat[y][x] = mat[max-1-x][y]
            
            # move right to bottom
            # mat[max-1-x][y] = mat[y][max-1-x]
            
            # move temp to right
            # mat[y][max-1-x] = temp

            y += 1
        end
        x += 1
    end


    mat
end

def print(mat)
    mat.each do |row|
        
    end
end

describe "rotate_in_place" do
    matrix = [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ]

    result = [
        [7,4,1],
        [8,5,2],
        [9,6,3]
    ]
    specify { expect(rotate_in_place(matrix)).to eq(result)}
end