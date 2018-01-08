

# 1.4 Palindrome Permutation:
# Given a string, write a function to check if it is a permutation of a palindrome. 
# A palindrome is a word or phrase that is the same forwards and backwards.
# A permutation is a rearrangement of letters. 
# The palindrome does not need to be limited to just dictionary words.
def palindrome_permutation?(string)
    # return false if string is empty
    return false if string == ""
   # step 1 create the hash
   counter = Hash.new
   # step 2 build hash
   string.each_char do |char|
        next if char == " "
        # step 2a if hash[key] does not exist or equals to 0 set value to 1
        if counter[char].nil? || counter[char] == 0
            counter[char] = 1
        # step 2b if hash[key] exist and value == 1 then set to 0
        else
            counter[char] = 0
        end
   end
    # step 3 get all values then reduce the sum
    sum = counter.values.reduce(:+)
    # 3a if values are 0 or 1 it is a palindrome permutation
    if sum <= 1
        true
    # 3b else false
    else
        false
    end
    
end