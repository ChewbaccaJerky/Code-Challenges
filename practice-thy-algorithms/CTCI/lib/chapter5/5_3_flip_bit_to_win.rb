=begin

    You have an integer and you can flip exactly one bit from a 0 to 1.
    Write code to find the length of the longest sequence of 1s you could create.

=end

def flip_bit_to_win(num)
    num_str = num.to_s(2)
    max = 0

    num_str.each_char.with_index do |bit, i|
        if bit == '0'
            test_str = num_str.dup
            test_str[i] = '1'

            test_str.split('0').each do |bit_seq|
                if bit_seq.length > max
                    max = bit_seq.length
                end
            end
        end
    end

    max
end