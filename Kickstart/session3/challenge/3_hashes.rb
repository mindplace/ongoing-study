# Write a method that takes a string and returns an array
# whose keys are all the downcased words in the string,
# and values are the number of times these words were seen.
#
# No punctuation will appear in the strings.
#
# Example:
# word_count "The dog and the cat" # => {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1}
require 'pry'

def word_count(string)
  word_array = string.downcase.split
  word_hash = word_array.group_by(&:itself)
  word_hash.map {|key, value| [key, value.length] }.to_h
end
