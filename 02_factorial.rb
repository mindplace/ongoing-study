# Write a method factorial which takes a number and returns the 
# product of every number up to the current number multiplied together.

def factorial(num)
    (1..num).to_a.inject(:*)
end