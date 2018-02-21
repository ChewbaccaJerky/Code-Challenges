# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2) 
    sum = (create_num(l1) + create_num(l2)).to_s
    sum = sum.split('').map do |num|
       ListNode.new(num.to_i) 
    end

    idx = 0
    len = sum.length
    while len - idx - 2 >= 0
       sum[len - idx - 1].next = sum[len - idx - 2]
        idx += 1
    end
    
    sum[-1]
end

def create_num(ll)
    result = ""
    
    until ll.nil?
       result = ll.val.to_s + result
       ll = ll.next
    end
    
    result.to_i
end
