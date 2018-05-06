# @param {String} s
# @return {Integer}
def longest_substring_wo_repeats(s)
    p = 0
    q = 0
    idx = {}
    result = ""
    
    while q < s.length
        char = s[q]
        unless idx[char]
            idx[char] = q
        else
            result = result.length < s[p...q].length ? s[p...q] : result
            while p <= idx[char] + 1
                delete idx[s[p]]
                p += 1
            end
            idx[char] = q
        end
        q += 1
        puts result
    end
    
    result.length < s[p...q].length ? s[p..q] : result
end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return 1 if s.length == 1
    p = 0
    q = 0
    idx = {}
    result = ""
    
    # Step 1 Iterate through string
    while q < s.length
        char = s[q]
        unless idx[char]
            idx[char] = q
        else
            result = result.length < s[p...q].length ? s[p...q] : result
            while p <= idx[char]
                idx.delete(idx[s[p]])
                p += 1
            end
            idx[char] = q
        end
        q += 1
    end
    
    puts p
    puts q
    result.length < s[p..q].length ? s[p..q].length : result.length
end