# You'll get a string and a boolean.
# When the boolean is true, return a new string containing all the odd characters.
# When the boolean is false, return a new string containing all the even characters.
# 
# If you have no idea where to begin, remember to check out the cheatsheets for string and logic/control
# 
# odds_and_evens("abcdefg",true)    # => "bdf"
# odds_and_evens("abcdefg",false)   # => "aceg"

def odds_and_evens(string, return_odds)
  returning = ""

    string.chars.each_with_index do |letter, i|
      if return_odds == true
        returning << letter if i.odd?
      elsif return_odds == false 
        returning << letter if i == 0 || i.even?
      end
    end
  
  returning
  
end

puts odds_and_evens("abcdefg",true)    # => "bdf"
puts odds_and_evens("abcdefg",false)   # => "aceg"