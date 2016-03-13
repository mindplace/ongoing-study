# given a string, return the character after every letter "r"
# 
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
  returning = ""
   string.downcase.chars.each_with_index do |letter, i|
     break if i == string.length - 1
     next if letter.empty?
     if letter == "r" && !string[i + 1].empty?
       returning << string[i + 1]
     end
   end
   
   returning
  
end


puts pirates_say_arrrrrrrrr("are you really learning Ruby?")
puts pirates_say_arrrrrrrrr("Katy Perry is on the radio!")
puts pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")