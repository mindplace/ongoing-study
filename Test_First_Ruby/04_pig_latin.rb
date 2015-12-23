def translate(string) 
    returning_string = [] 
    string.split.each do |word| 
        vowel_index = word.index(/[aeiou]/)
        vowel_index += 1 if (word[vowel_index] == "u" && word[vowel_index - 1] == "q")
        (returning_string << (word[vowel_index..-1] + word[0...vowel_index] + "ay")) if vowel_index != 0
        (returning_string << (word + "ay")) if vowel_index == 0
    end
    returning_string.join(" ")
end
 
        
        