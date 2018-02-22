# @param {Integer[]} nums
# @return {Integer[][]}

### BRUTE FORCE O(n^3) ###
def naive_three_sum(nums)
    
    perm = []
    
    nums.each.with_index do |num1, i|
       nums.each.with_index do |num2, j|
          nums.each.with_index do |num3, k|
             next if i == j || j == k || i == k
             temp_arr = [num1, num2, num3].sort
             perm << temp_arr unless perm.include?(temp_arr)
          end
       end
    end

    perm.select do |arr|
       arr.reduce(:+) == 0 
    end
end

