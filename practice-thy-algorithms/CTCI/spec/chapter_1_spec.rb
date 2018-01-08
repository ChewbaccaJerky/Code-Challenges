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