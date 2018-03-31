# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums, node = nil)
    return nums if nums.empty?
    
    mid = nums.length / 2
    
    left = nums[0...mid]
    right = nums[mid+1..-1]
    
    node = TreeNode.new(nums[mid]) if node.nil?
    
    node.left = TreeNode.new(left[left.length/2]) if left[left.length/2]
    node.right = TreeNode.new(right[right.length/2]) if right[right.length/2]
        
    sorted_array_to_bst(left, node.left)
    sorted_array_to_bst(right, node.right)
    
    node
end