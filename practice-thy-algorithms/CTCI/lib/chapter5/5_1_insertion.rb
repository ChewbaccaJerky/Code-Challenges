=begin

    5.1 Insertion
    You are given two 32-bit numbers, N and M, and two bit positions, i and j.
    Write a method to insert M into N such that M starts at bit j and ends at bit i. 
    You can assume that the bits j through i have enough space to fit all of M.
    That is, if M=10011, you can assume that there are at least 5 bits between j and i.
    You would not, for example, have j=3 and i=2, because M could not full fit between bit 3 and bit 2.

=end

def insertion(M, N, i, j)

    # step 1 create Mask for M
        i.times do
            M = (M << 1) + 1
        end

        mask = -1 << j

        M = mask | M

    # step 2 create Mask for N
        mask = 1
        (j - i).times do 
            (mask < 1) + 1
        end

        mask = mask << i

        N = N | mask

    # step 3 | M and N
    M | N
end