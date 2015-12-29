# Write a program that prints the numbers from 1 to 100.
# But for multiples of three print “Fizz” instead of the
# number and for the multiples of five print “Buzz”. For
# numbers which are multiples of both three and five
# print “FizzBuzz”.


def fizzbuzz(num)
   (1..num).each do |item|
       x = ""
       x += "Fizz" if item % 3 == 0
       x += "Buzz" if item % 5 == 0
       puts(x.empty? ? item : x)
   end
end

#puts fizzbuzz(30)
