=begin
Given a list of words (without duplicates), please write a program that returns all concatenated 
words in the given list of words.
A concatenated word is defined as a string that is comprised entirely of at least two shorter 
words in the given array.

Example:
Input: ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]

Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]

Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats"; 
 "dogcatsdog" can be concatenated by "dog", "cats" and "dog"; 
"ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".
Note:
The number of elements of the given array will not exceed 10,000
The length sum of elements in the given array will not exceed 600,000.
All the input string will only include lower case letters.
The returned elements order does not matter.

@param {String[]} words
@return {String[]}
=end
def find_all_concatenated_words_in_a_dict(words)
    return [""] if words == [""]
    result = []
    
    words.each.with_index do |word, idx|
       result << word if concated?(words[idx], words[0...idx] + words[idx+1..-1])
    end
    
    result
end

def concated?(cur_word, words)
   return true if cur_word == ''

   result = false
   words.each.with_index do |word, i|
     new_word = cur_word.gsub(word, '')
     
     if new_word != cur_word
        result = result || concated?(new_word, words[0...i] + words[(i+1)..-1])
     end
   end

   result
end