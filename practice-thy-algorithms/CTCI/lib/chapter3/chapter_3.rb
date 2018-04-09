# Three In One: Describe how you could use a single array to implement three stacks

class ThreeInOne
    def initialize
        @size = [0,0,0]
        @MAX = 30
        @stack = Array.new(@MAX, nil)
    end

    def push(stack_num, val)
        if @MAX == @stack.length
            @MAX *= 2
            @stack += Array.new(@MAX, nil)
        end

        size = @size[stack_num] += 1
        idx = 3 * size + stack_num
        @array[idx] = val
        size
    end

    def pop(stack_num)
        idx = 3 * @size[stack_num] + stack_num
        val = @array[idx]
        @size[stack_num] -= 1
        val
    end

    def isEmpty(stack_num)
        return true if @size[stack_num] == 0

        false
    end

    def peek(stack_num)
        idx = 3 * @size[stack_num] + stack_num
        @array[idx]
    end
end