

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

# 1.5 One Away: There are three types of edits that can be performed on strings: insert a character,
# remove a chataracter, or replace a character. Given two strings, 
# write a function to check if they are one edit(or zero edits) away

# case 0 string is not edited
# "hello"
# "hello"

# case 1 character changed
# "hello"
# "hallo"

# case 2 character removed
# "hello"
# "hllo"

def one_away?(str, edit_str)
    # case 0: no edit
    return true if str == edit_str
    len = str.length
    edit_counter = 0
    
    # case 1: character changed
    if len == edit_str.length
        len.times do |i|
            if str[i] != edit_str[i]
                edit_counter += 1
            end
        end
    # case 2: character removed 
    else
        str.each_char do |ch|
            unless str.include?(ch)
                edit_counter += 1
            end
        end
    end

    edit_counter > 1 ? false : true
end

# 1.6 String Compression: Implement a method to perform basic string compression
# using the counts of repeated characters. 
# For example, the string aabcccccaaa => a2b1c5a3.
# If the "compressed" string would not become smaller than the original string,
# your method should return the original string. 
# You can assume the string has only uppercase and lowercase letters(a - z)

def string_compression(str)
    # step 1 create variables
    result = ""
    counter = 0
    cur_char = ""
    
    str.each_char do |ch|
        if cur_char != ch
            result += cur_char
            result += counter.to_s if counter != 0

            cur_char = ch
            counter = 1
        elsif cur_char == ch
            counter += 1
        end
    end

    result = counter != 0 ? result + cur_char + counter.to_s : ""
end

