class Book
  attr_accessor :title

  def word_check(word)
      lowercase_words = ["the", "a", "an", "and", "in", "of"]
      lowercase_words.include?(word) ? false : true
  end
  
  def title
      working_title = @title.split
      returning_title = []
      working_title.each do |word|
          word_check(word) ? returning_title << word.capitalize : returning_title << word
      end
      returning_title[0] = returning_title[0].capitalize
      returning_title.join(" ")
  end
end
