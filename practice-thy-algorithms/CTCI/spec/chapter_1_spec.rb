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