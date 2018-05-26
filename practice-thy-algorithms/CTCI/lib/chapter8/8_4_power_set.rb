=begin
 8.4 CTCI Power Set
 
 Write a method to return all subsets of a set

=end

# Binary Solution
def power_set(subset)
  result = []
  max_length = (2 ** (subset.length)) + 1
  
  max_length.times do |i|
   sub = convert_to_subset(i, subset)
   result << subset
  end

  result
end

def convert_to_subset(num, subset)
  sub = []

  binary_arr = num.to_s(2).split('')

  binary_arr.each_index do |i|
    if binary_arr[i] == '1'
      sub << subset[i]
    end
  end

  sub
end

# Recursive Solution

def recursive_power_set(subset)
  return [[]] if subset.empty?

  sub = recursive_power_set(subset[1..-1])

  char = subset[0]
  sub + sub.map {|arr| arr + [char]}
end

print recursive_power_set(['a', 'k', 'd'])