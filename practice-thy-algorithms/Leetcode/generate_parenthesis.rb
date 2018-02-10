# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

# For example, given n = 3, a solution set is:
require "byebug"

NUM3 = [
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
require 'set'

def generate_parenthesis(num)
    paren = ""
    num.times { paren += '()'}
    result = [paren]

    paren = paren.split('')
    
    num.times do
        # get idx of first instance of right paren
        idx = get_r_index(paren)
        # while right paren is not at idx == -1
        until idx == paren.length - 1
            debugger
            temp = paren[idx]
            paren[idx] = paren[idx+1]
            paren[idx+1] = temp
            result << paren.join('')
            idx += 1
        end
    end

    result.uniq
end

def get_r_index(arr)
    arr.each_index do |idx|
        return idx if arr[idx] == ')'
    end
end

# describe "generate_parenthesis" do 
#     specify { expect(generate_parenthesis(3)).to eq(NUM3) }
# end