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