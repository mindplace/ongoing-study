# Write a method, reverse_map, which invokes a block on each of the elements in reverse order,
# and returns an array of their results.
#
# reverse_map(1, 2, 3) { |i| i * 2 }      # => [6, 4, 2]

def reverse_map(*args, &block)
  returning = []

  j = args.length - 1
  while j >= 0
    returning << yield(args[j])
    j -= 1
  end
  returning
end
