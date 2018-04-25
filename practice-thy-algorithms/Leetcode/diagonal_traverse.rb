=begin

498. Diagonal Traverse

Given a matrix of M x N elements (M rows, N columns), 
return all elements of the matrix in diagonal order as shown in the below image.

Input:
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
Output:  [1,2,4,7,5,3,6,8,9]


=end

# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
    return matrix if matrix.empty?
    result = []
    hash = {}
    max = 0
    matrix.each.with_index do |row, i|
        row.each.with_index do |num, j|
            max = (i + j) if max < (i + j)
            
            if hash[i + j]
                hash[i + j] << num
            else
                hash[i + j] = [num]
            end 
        end
    end
    
    (max + 1).times do |i|
        if i % 2 == 0
            result += hash[i].reverse
        else
            result += hash[i]
        end
    end
        
    result
end