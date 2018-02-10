# Leetcode Problem #5

# Given a string s, find the longest palindromic substring in s. 
# You may assume that the maximum length of s is 1000.


def longest_palindrome(str)
    longest = ""

    i = 0
    # Step 1 iterate through each char
    while i < str.length
        j = 0
        # Step 2 Check if adjacent chars are equal
        left = i
        if str[left] == str[left + 1]
            right = left + 1
            while str[left] == str[right]
                right += 1
            end
            right -= 1

            # expand until not a palindrome
            until str[left] != str[right]
                longest = str[left..right] if str[left..right].length > longest.length
                left -= 1
                right += 1
            end
        elsif str[left] == str[left + 2]
            right = (left + 2)
            until str[left] != str[right]
                longest = str[left..right] if str[left..right].length > longest.length
                left -= 1
                right += 1
            end
        end
        i += 1
    end

    longest == "" ? str[0] : longest
end

describe "longest_palindrome" do
    specify{ expect(longest_palindrome("abadc")).to eq("aba") }
    specify{ expect(longest_palindrome("adgracecar")).to eq("racecar") }
    specify{ expect(longest_palindrome("acdbg")).to eq("a") }
    specify{ expect(longest_palindrome("ccc")).to eq("ccc") }
    specify{ expect(longest_palindrome("cccc")).to eq("cccc") }
end