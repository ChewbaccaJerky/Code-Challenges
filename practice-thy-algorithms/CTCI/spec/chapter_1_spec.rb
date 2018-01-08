require 'chapter_1'

describe 'palindrome_permutation' do 
    specify { expect(palindrome_permutation?('')).to be false}
    specify { expect(palindrome_permutation?('taco cat')).to be true}
    specify { expect(palindrome_permutation?('racc ear ')).to be true}
end