# Write a method named every_other_char for strings that,
# returns an array containing every other character
#
# example:
# "abcdefg".every_other_char  # => "aceg"
# "".every_other_char         # => ""

class String
  def every_other_char
    returning = ""
    self.chars.each_with_index{|letter, i| returning << letter if i == 0 || i.even?}
    returning
  end
end
