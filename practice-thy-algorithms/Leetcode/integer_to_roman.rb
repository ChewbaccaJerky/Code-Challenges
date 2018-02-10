# Given an integer, convert it to a roman numeral.
# Input is guaranteed to be within the range from 1 to 3999.
# 1     => 'I'
# 10    => 'X'
# 50    => 'L'
# 100   => 'C'
# 500   => 'D'
# 1000  => 'M'
def int_to_roman(num)

end

describe "int_to_roman" do
    specify { expect(int_to_roman(9)).to eq('IX') }
    specify { expect(int_to_roman(25)).to eq('XXV') }
    specify { expect(int_to_roman(53)).to eq('LIII') }
    specify { expect(int_to_roman(150)).to eq('CL') }
    specify { expect(int_to_roman(890)).to eq('DCCCXC') }
    specify { expect(int_to_roman(1800)).to eq('MDCCC') }
    specify { expect(int_to_roman(3600)).to eq('MMMDC') }
    specify { expect(int_to_roman(3999)).to eq('MMMCMXCIX') }
end