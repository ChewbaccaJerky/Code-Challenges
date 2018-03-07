
# 9 Palindrome Number
# Determine whether an integer is a palindrome. Do this without extra space.


def palindrome_number?(num)
    num.to_s == num.to_s.reverse
end


describe "palindrome_number" do
    specify{ expect(palindrome_number?(1221)).to eq(true)}
    specify{ expect(palindrome_number?(151)).to eq(true)}
    specify{ expect(palindrome_number?()1234).to eq(false)}
end