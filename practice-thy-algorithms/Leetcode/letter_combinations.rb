# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    result = []
    digit_hash = {
        '0' => [' '],
        '2' => ['a', 'b', 'c'],
        '3' => ['d', 'e', 'f'],
        '4' => ['g','h','i'],
        '5' => ['j', 'k', 'l'],
        '6' => ['m', 'n', 'o'],
        '7' => ['p', 'q', 'r', 's'],
        '8' => ['t', 'u', 'v'],
        '9' => ['w', 'x', 'y', 'z']
    }
    
    potentialChars = digits.split('').map do |dig|
       digit_hash[dig] 
    end
    
    # Set result with the first set of characters
    result = potentialChars.first ? potentialChars.first : []
    
    potentialChars.each.with_index do |arr, idx|
       next if idx == 0
       tempArr = []
       result.each do |str|
        arr.each do |char|
            tempArr << str + char        
        end
       end
       result = tempArr
    end
    
    result
end
