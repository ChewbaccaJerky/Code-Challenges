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

def three_sum_slow(nums)
    combo = nums.combination(3).to_a
    (combo.map!{|arr| arr.sort }).select{ |arr| arr.reduce(:+) == 0 }.uniq
end

def three_sum_double_pointer(nums)
    nums.sort! # O(nLogn)
    l = 0
    r = nums.length - 1
    result = []    
end

# def three_sum(nums)
#     perm = nums.combination(3).to_a
#     result = perm.select do |nums|
#         if nums.reduce(:+) == 0
#     end

#     result
# end

def three_sums(nums)
    nums.sort!
    l = 0
    r = nums.length - 1
    result = []

    i = 0
    until r < l
        sum = nums[r] + nums[l]
    end

    result.uniq
end

arr = [-1, 0, -1, 1, 2]
print three_sums(arr)
