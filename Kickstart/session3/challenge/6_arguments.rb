# Write a method, match_maker, which will receive an unknown number of
# elements, and return an array where every two elements are represented by true or false.
#
# The very first parameter will not be part of this set. Instead, it will tell
# you how to determine what their value should be.
# If it is true, then they will be true when they are oppositely truthy.
# If it is false, then they will be true when they are similarly truthy.
#
# Examples:
# match_maker false, true,  true                # => [true]
# match_maker true,  true,  true                # => [false]
# match_maker true,  false, false               # => [false]
# match_maker true,  false, true                # => [true]
# match_maker true,  true,  false               # => [true]
# match_maker true,  true,  true, false, true   # => [false, true]
# match_maker true,  true,  true, false, nil    # => [false, false]
# match_maker true,  true,  true, true, nil     # => [false, true]
# match_maker true,  true,  true, 0, nil        # => [false, true]
require 'pry'
def true_and_false(first, second)
  (first || first == true) && (second.nil? || second == false) ||
  (second || second == true) && (first.nil? || first == false)
end

def match_maker(valuer, *args)
  returning = []
  (0...args.length).step(2) do |i|
    first = args[i]
    second = args[i + 1]

    valuer ?
    returning << true_and_false(first, second) :
    returning << !true_and_false(first, second)
  end

  returning
end
