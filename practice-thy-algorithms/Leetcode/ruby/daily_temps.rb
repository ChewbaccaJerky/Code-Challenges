=begin

739. Daily Temperatures 

Given a list of daily temperatures, produce a list that, for each day in the input, 
tells you how many days you would have to wait until a warmer temperature. 
If there is no future day for which this is possible, put 0 instead.

For example, given the list temperatures = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
=end

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
    stack = []
    result = [0] * (temperatures.length )
    
    
    i = temperatures.length - 1
    
    while i >= 0
        ans = 0
        cur_val = temperatures[i]
        
        until stack.empty? || cur_val < temperatures[stack[-1]]
            stack.pop
        end
        
        if stack.empty?
            result[i] = ans
        elsif cur_val < temperatures[stack.last]
            ans = stack.last - i
            result[i] = ans
        end
        
        stack << i
        puts ""
        
        i -= 1
    end
    
    result
end