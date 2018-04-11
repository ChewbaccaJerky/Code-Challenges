=begin

    5.7 Pairwise Swap
    Write a program to swap odd and even bits in an integer with as few instructions as
    possible.

=end

def pairwise_swap(num)
    ((num & 0x88) >> 1) | ((num & 0x55) << 1)
end

puts pairwise_swap(5)