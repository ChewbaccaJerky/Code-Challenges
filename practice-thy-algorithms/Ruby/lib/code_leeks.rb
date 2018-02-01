require 'set'
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# Example:
# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# Time Complexity O(n)
def two_sum(nums, target)
    nums_hash = {}
    
    nums.each.with_index do |num, idx|
        nums_hash[num] = idx
    end
    
    nums.each.with_index do |num1, i|
        val = target - num1
        
        return [i, nums_hash[val]] if nums_hash[val] && nums_hash[val] != i
    end
end

# Dot Product formula: Calculus 2
def xxx(x, y)
    sum = 0

    x.each_index do |i|
        sum += (x[i] * y[i])
    end

    sum
end

def yyy(vec)
    size = v.length
    i = 0

    while i < size
        j = 0
        set = Set.new

        while j < size
            next if i == j
            return true if set.include?(vec[j] ** 2)
            set.add(vec[i]**2 - vec[j]**2)    
            j += 1
        end
        i += 1
    end

    false
end