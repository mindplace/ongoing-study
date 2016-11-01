# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(num)
  hash = {}
  while num > 0

    if num % 2 == 0 # even numbers
      keys = hash.keys.select{|key| key > num}
      if keys.length
        keys.each do |key|
          hash[key][hash[key].length] = num
          hash[key] = hash[key].sort
        end
      end

    else
      hash = ({num => []}).merge(hash)
    end

    num -= 1
  end

  hash
end
