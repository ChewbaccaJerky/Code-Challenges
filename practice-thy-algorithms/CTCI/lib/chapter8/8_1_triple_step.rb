=begin

    8.1 Triple Step
    A child is running up a staircase with n steps and can hop either 1 step, 2 step, or 3 steps
    at a time. Implement a method to count how many possible ways the child can run up the stairs.

=end

MEMO = {}

def triple_step(n)
    return 0 if n < 0
    return 1 if n == 0

    unless MEMO[n].nil?
        return MEMO[n]
    end

    count = 0

    (1..3).to_a.each do |step|
        count += triple_step(n - step)
    end

    MEMO[n] = count
    count
end

puts triple_step(100)