
# CTCI Power Set 8.4

def power_set(subset)
  result = []
  max_length = (2 ** (subset.length)) - 1
  
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
