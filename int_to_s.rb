
# A method that converts integer to string
# (Implementing the ruby 'to_s" method

def int_to_s (num)
       
   digits = {
       0 => '0',
       1 => '1',
       2 => '2',
       3 => '3',
       4 => '4',
       5 => '5',
       6 => '6',
       7 => '7',
       8 => '8',
       9 => '9'
   }
   
   return '0' if num == 0
   
   if num < 0
       s = '-'
       num = num.abs
   else
       s = ''
   end
   
   dig_arr = []
   while num != 0
      dig_arr << digits[num % 10]
      num = num / 10
   end
   
   dig_arr.reverse!
   dig_arr.each do |chr|
       s += chr
   end
   s
end
