

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

# 1.8 Zero Matrix
# Write an algorithm such that if an element in an MxN matrix is 0, 
# its entire row and column are set to 0.
# Time Complexity O(n)

def zero_matrix(matrix)
    coords = []
    # step 1 find all 0 coordinates
    matrix.each_index do |row|
        matrix[row].each_index do |col|
            coords << [row, col] if matrix[row][col] == 0
        end
    end

    # step 2 change all rows and columns adjacent from coordinates to 0
    coords.each do |coord|
        # 2a. change row to zeros
        matrix.length.times do |i|
            matrix[i][coord[1]] = 0
        end

        # 2b. change column to zeros
        matrix[0].length.times do |j|
            matrix[coord[1]][j] = 0
        end
    end

    matrix
end

# 1.9 StringRotation
# Assume you have a method isSubstring which checks if one word is a substring
# of another. Given two strins, s1 and s2, write code to check if s2 is a rotation of s1
# using only one call to isSubstring.
# Time Complexity

def string_rotation(str1, str2)
    return true if str1 == str2
    len = str1.length
    i = 0
    j = 0

    while i < len && j < len
        if str1[i] != str2[j]
            i += 1
        else
            i += 1
            j += 1
        end
    end

    str1 == str2[j..-1] + str2[0...j]
end
