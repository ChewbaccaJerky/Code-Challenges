=begin

496. Next Greater Element I

You are given two arrays (without duplicates) nums1 and nums2 where nums1’s elements are subset of nums2. Find all the next greater numbers for nums1's elements in the corresponding places of nums2.

The Next Greater Number of a number x in nums1 is the first greater number to its right in nums2. If it does not exist, output -1 for this number.

Example 1:
Input: nums1 = [4,1,2], nums2 = [1,3,4,2].
Output: [-1,3,-1]
Explanation:
    For number 4 in the first array, you cannot find the next greater number for 
    it in the second array, so output -1.
    For number 1 in the first array, the next greater number for it in the second array is 3.
    For number 2 in the first array, there is no next greater number for it in the second array, 
    so output -1.
Example 2:
Input: nums1 = [2,4], nums2 = [1,2,3,4].
Output: [3,-1]
Explanation:
    For number 2 in the first array, the next greater number for it in the second array is 3.
    For number 4 in the first array, there is no next greater number for it in the second array, 
    so output -1.
Note:
All elements in nums1 and nums2 are unique.
The length of both nums1 and nums2 would not exceed 1000.

=end

# @param {Integer[]} find_nums
# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_element(find_nums, nums)
    hash = {}
    result = Array.new(find_nums.length) {-1}
    
    # create hash
    nums.each.with_index do |num, i|
       hash[num] = i 
    end
    
    # iterate through nums
    find_nums.each.with_index do |num, i|
        result[i] = next_greater_value(find_nums, nums, i, hash)
    end
    
    result
end

def next_greater_value(find_nums, nums, idx, hash)
   start_idx = hash[find_nums[idx]]
   start_val = find_nums[idx]
    
   while start_idx < nums.length
        if start_val < nums[start_idx]
            return nums[start_idx]
        end
       
       start_idx += 1
   end
    
   -1
end