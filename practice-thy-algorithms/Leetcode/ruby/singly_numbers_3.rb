
=begin
Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.

Example:

Input:  [1,2,1,3,2,5]
Output: [3,5]
Note:

The order of the result is not important. So in the above example, [5, 3] is also correct.
Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
=end


# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    count_hash = {}
    
    nums.each do |num|
        if count_hash[num]
            count_hash[num] += 1
        else
            count_hash[num] = 1
        end
    end
    
    result = []
    count_hash.each do |key, val|
        if val == 1
            result << key
        end
    end
    
    result
end
