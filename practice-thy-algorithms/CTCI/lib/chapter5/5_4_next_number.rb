=begin

    5.4 Next Number
    Given a positive integer, print the next smallest and next largest number that
    have the same number of 1 bits in their binary representation.

=end

def next_number(num)
    num_1s = num.to_s(2).count('1')
    larg = nil
    smal = nil

    i = 1
    until larg && smal
        larg = num + i if (num + i).to_s(2).count('1') == num_1s
        smal = num - i if (num - i).to_s(2).count('1') == num_1s
        i += 1
    end

    [smal, larg]
end

puts next_number(5)