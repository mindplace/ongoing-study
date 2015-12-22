# Write a method is_prime? which takes in a number and returns true 
# if it is a prime number.

def is_prime?(num)
    (2..num).to_a.select{|i| num % i == 0} == [num]
end