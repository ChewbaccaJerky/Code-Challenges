
# Given an array consisting of n integers, find the contiguous subarray of given length k 
# that has the maximum average value. 
# And you need to output the maximum average value.

# Example 1:
# Input: [1,12,-5,-6,50,3], k = 4
# Output: 12.75
# Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75
# Note:
# 1 <= k <= n <= 30,000.
# Elements of the given array will be in the range [-10,000, 10,000].

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
    max_avg = nil
    
    i = 0
    while i + k <= nums.length
       val = nums[i...i+k].reduce(:+) / (k * 1.0) 
       max_avg = val if max_avg.nil? || val > max_avg
       i += 1
    end
    
    max_avg
end