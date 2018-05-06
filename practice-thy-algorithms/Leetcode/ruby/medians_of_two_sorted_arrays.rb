=begin
4. Medians Of Two Sorted Arrays
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5

=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    
    len = nums1.length + nums2.length
    arr = []
    
    arr = concat_sorted_arrays(nums1, nums2)
    
    if arr.length%2 == 1
        arr[arr.length/2] * 1.0
    else
        (arr[arr.length/2] + arr[(arr.length/2)-1])/2.0
    end
end

def concat_sorted_arrays(nums1, nums2)
    arr = []
    until nums1.empty? || nums2.empty?
        if nums1.first < nums2.first
           arr << nums1.shift
       else
           arr << nums2.shift
       end
    end
    
    arr += nums1
    arr += nums2
end