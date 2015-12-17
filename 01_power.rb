# Write a method power which takes two integers (base and exponent) 
# and returns the base raised to the power of exponent. 
# Do not use Ruby’s ** operator for this!

def power(base, exponent)
    result = 1
    exponent.times {result *= base}
    result
end



