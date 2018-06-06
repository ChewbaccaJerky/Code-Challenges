
# Convert Integer to Roman Numeral

# @param {Integer} num
# @return {String}
def int_to_roman(num)
    roman = [
        ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
        ['X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'],
        ['C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'],
        ['M', 'MM', 'MMM']
    ]
    
    result = ""
    
    numArr = num.to_s.split('')
    len = numArr.length
    
    numArr.each_index do |i|
       next if numArr[i] == '0'
       place = len - i - 1
       index = (numArr[i].to_i) - 1
       result += roman[place][index]
    end
    
    result
    
end
