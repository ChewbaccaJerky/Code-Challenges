=begin

# 670. Maximum Swap

Given a non-negative integer, you could swap two digits at most once to get the maximum valued number. Return the maximum valued number you could get.

Example 1:
Input: 2736
Output: 7236
Explanation: Swap the number 2 and the number 7.
Example 2:
Input: 9973
Output: 9973
Explanation: No swap.
Note:
The given number is in the range [0, 108]

=end

# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
    return num if num.to_s.length < 1
    nums = num.to_s.split('')
    
    nums.each.with_index do |cur_num, idx|
        max_idx = nums[idx+1..-1]
        max_idx += idx
        if max_idx && cur_num < nums[max_idx]
            swap(nums, idx, max_idx)
            return nums.join('').to_i
        end
    end
    
    return nums.join('').to_i
end

def swap(nums, i, j)
    val_a = nums[i]
    val_b = nums[j]
   
    nums[i] = val_b
    nums[j] = val_a
    
    nums
end

def get_max(nums, idx)
    counter = {}
    
    # create counter hash
    nums.each.with_index do |num, i|
        next if i == idx
        if counter[num]
            counter[num] << i
        else
            counter[num] = [i]
        end
    end
    
    # pick max from keys
    key = counter.keys.max
    # get last index from key=>value
    return counter[key][-1] if key
    
    nil
end

describe "maximum_swap" do
    
    it "should accept 838768" do 
        expect(maximum_swap(838768)).eq to(888763)
    end
end