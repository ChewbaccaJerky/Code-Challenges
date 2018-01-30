class LinkedList
    def initialize
        @head = nil
        @length = 0
    end

    def add(value)
        new_node = Node.new(value)
        #increment length
        @length += 1

        # case 1
        if head.nil?
            @head = new_node
        else
        # case 2
            q = head
            until q.next.nil?
                q.next = new_node
            end
        end
    end
    
    def print
        q = head

        until q.next.nil?
            print q.value + " -> "
        end

        print "nil"
    end
end

class Node 
    attr_accessor :next, :value
    def initialize(value)
        @value = value
        @next = nil
    end
end