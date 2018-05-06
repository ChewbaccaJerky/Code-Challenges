=begin

Given a string, sort it in decreasing order based on the frequency of characters.

Example 1:

Input:
"tree"

Output:
"eert"

Explanation:
'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
Example 2:

Input:
"cccaaa"

Output:
"cccaaa"

Explanation:
Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
Note that "cacaca" is incorrect, as the same characters must be together.
Example 3:

Input:
"Aabb"

Output:
"bbAa"

Explanation:
"bbaA" is also a valid answer, but "Aabb" is incorrect.
Note that 'A' and 'a' are treated as two different characters.

=end

# @param {String} s
# @return {String}
def frequency_sort(s)
  # step 1 Create Counter Hash
  counter_hash = {}
  s.each_char do |char|
    if counter_hash[char]
        counter_hash[char] += 1
    else
        counter_hash[char] = 1
    end
  end

  # Step 2 Create array from hash
  char_count = counter_hash.to_a
    
  # Step 3 Sort by count
  char_count.sort! do |char1, char2|
    # comparing char count
    char2[1] <=> char1[1]
  end

  # Step 4 Create new string
  sorted_str = ""
  char_count.each do |char_arr|
    char_arr[1].times do 
        sorted_str << char_arr[0] 
    end
  end
    
  sorted_str
end