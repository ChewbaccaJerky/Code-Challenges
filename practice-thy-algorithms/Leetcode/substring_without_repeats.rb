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
            p = idx[char] + 1
            idx[char] = q
        end
        q += 1
        puts result
    end
    
    result.length < s[p...q].length ? s[p..q] : result
end