require "byebug"

class Node 
    attr_accessor :next, :value
    
    def initialize(value)
        @value = value
        @next = nil
    end
end

class LinkedList
    attr_accessor :head, :length

    def initialize
        @head = nil
        @length = 0
    end

    def add(value)
        new_node = Node.new(value)

        if @head.nil?
            @head = new_node
        else
            q = @head.dup
            until q.next.nil?
                q = q.next
            end

            q.next = new_node
        end
        
        @length += 1
    end

end