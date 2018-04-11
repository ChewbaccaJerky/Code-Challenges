=begin

    5.6 Conversion
    Write a function to determine the number of bits you would need to flip to convert
    integer A to B.

=end

def conversion(a, b)
    bits = a ^ b
    bits.to_s(2).count('1')
end

puts conversion(45, 63)