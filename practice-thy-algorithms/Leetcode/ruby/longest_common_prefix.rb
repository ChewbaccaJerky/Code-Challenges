###### NAIVE SOLUTION #######
# @param {String[]} strs
# @return {String}
def longest_common_prefix_1(strs)
    # ["", "b"] => ""
    # ["a", "b"] => ""
    # ["ab", "abc"] => "ab"
    # ["abx", "xba"] => ""
    result = ""
    
    # Step 1 Get longest str O(n)
    longest_str = ""
    strs.each { |str| longest_str = str if longest_str.length <= str.length }
    # Step 2 Iterate through longest str's chars O(N^2)
    longest_str.each_char.with_index do |char, i|
        included = true
        # Step 2a Iterate through strs
        strs.each do |str|
            next if i == j # next if the same characters
            
            # if char from str is not included in str set included to false
            included = false unless str[i] == longest_str[i]         
        end
        # if included is true push char to result else break
        if included
            result += char
        else
            break
        end
    end
    
    # Step 3 Return result
    result
end

def longest_common_prefix_2(strs)
    # case 0: Handle empty array
    return "" if strs.empty?

    # Step 0: inialize variables
    prefix = ""
    str = strs.first

    # Step 1: Iterate through characters of string
    str.each_char.with_index do |char, i|
        included = true
        # Step 2: Iterate through str
        strs.each do |str|
            # Step 2a: If str[i] does not equal to current char then return false
            included = false unless char == str[i]
        end

        # Step 3: Add to prefix if included else break out of loops
        included ? prefix += char : break
    end

    # Step 4 Return result
    prefix
end