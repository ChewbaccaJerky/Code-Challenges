# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
    len = 0
    q = head
    
    # Step 1 Get Length
    until q.nil?
        len += 1
        q = q.next
    end
    
    return head if len == 0
    
    p = head
    
    # Step 2 Move P pointer right before the split
    (len - (k%len) - 1).times do
        p = p.next
    end
    
    q = p
    
    # Step 3 Move q to last node
    until q.next.nil?
       q = q.next 
    end
    
    # Step 4 Set new pointers
    q.next = head
    head = p.next
    p.next = nil
    
    head
end