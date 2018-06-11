=begin

Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

Example 1:
Input: "aba"
Output: True
Example 2:
Input: "abca"
Output: True
Explanation: You could delete the character 'c'.
Note:
The string will only contain lowercase characters a-z. The maximum length of the string is 50000.

=end

# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
    
    left = 0
    right = s.length - 1
    
    while left < right
        # print "#{left} #{right} \n"
        if s[left] != s[right]
           return is_palindrome?(s[left...right]) || is_palindrome?(s[left+1..right]) 
        end
        left += 1
        right -= 1
    end
    
    true
end

def is_palindrome?(s)
   mid = s.length / 2 
   if s.length % 2 == 0
      s[0...mid] == s[mid..-1].reverse
   else
      s[0...mid] == s[mid+1..-1].reverse   
   end
end
