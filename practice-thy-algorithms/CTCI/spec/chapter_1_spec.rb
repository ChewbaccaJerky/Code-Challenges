require 'chapter_1'

describe 'palindrome_permutation' do 
    specify { expect(palindrome_permutation?('')).to be false}
    specify { expect(palindrome_permutation?('taco cat')).to be true}
    specify { expect(palindrome_permutation?('racc ear ')).to be true}
end

describe 'one_away' do
    specify { expect(one_away?("hello", "helo")).to be true}
    specify { expect(one_away?("super", "supen")). to be true}
    specify { expect(one_away?("hey there", "hey there")).to be true}
    specify { expect(one_away?("cake", "bart")).to be false}
end

describe 'string_compression' do 
    specify { expect(string_compression("aaabbbccaa")).to eq("a3b3c2a2")}
    specify { expect(string_compression("abc")).to eq("a1b1c1")}
    specify { expect(string_compression("daawwwwggg")).to eq("d1a2w4g3")}
    specify { expect(string_compression("")).to eq("")}
end

describe 'zero_matrix' do
    matrix1 = [
        [1, 0, 1, 3],
        [0, 1, 4, 2],
        [1, 1, 1, 1],
        [2, 3, 2, 1],
        [1, 1, 1, 1]
    ]

    matrix2 = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 1, 1],
        [0, 0, 2, 1],
        [0, 0, 1, 1]
    ]

    matrix3 = [
        [1, 1, 1, 3],
        [1, 1, 4, 1],
        [1, 1, 1, 1],
        [2, 3, 2, 1]
    ]

    specify { expect(zero_matrix(matrix1)).to eq(matrix2) }
    specify { expect(zero_matrix(matrix3)).to eq(matrix3) }
end

describe 'string_rotation' do 
    str1 = "aabbcc"
    str2 = "ccaabb"
    str3 = "bbccaa"

    specify { expect(string_rotation(str1, str2)).to eq(true)}
    specify { expect(string_rotation(str1, str3)).to eq(true)}
    specify { expect(string_rotation(str1, str1)).to eq(true)}
    specify { expect(string_rotation(str1, "aaccbb")).to eq(false)}
end