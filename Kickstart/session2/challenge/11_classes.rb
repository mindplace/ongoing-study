# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around, 
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class TranslateNum
  attr_reader :number, :translated 
  
  def initialize(number)
    @number = number
    @translated = in_words
  end
  
  def ones_place(integer)
    portion = integer.to_s[-1].to_i
    teen_test = integer.to_s[-2..-1].to_i
    teenager = true if (teen_test > 10 && teen_test < 20)
    return "" if portion == 0 || teenager 
    ones(portion)
  end
  
  def tens_place(integer)
    result = integer / 10
    portion = result.to_s[-1].to_i
    teen_test = integer.to_s[-2..-1].to_i
    teenager = true if (teen_test > 10 && teen_test < 20)
    return "" if portion == 0
    if teenager
      teens(teen_test)
    elsif portion == 1
      ones(10)
    else
      tens(portion)
    end
  end
  
  def test_and_deliver(result)
    set = {
      :portion_hundred => result.to_s[-3..-1].to_i,
      :portion_tens => result.to_s[-2..-1].to_i,
      :portion_ones => result.to_s[-1].to_i
    }
    
    string = ""
    set.each do |key, value|
      level = set.keys.index(key)
      if value != 0 && level == 0
        string << hundreds(value)
      elsif value != 0 && level == 1
        string << tens_place(value)
      elsif value != 0 && level == 2
        string << ones_place(value)
      end
    end
    
    string 
  end
  
  def test_tester(result, level)
    completed_test = test_and_deliver(result)
    if completed_test.empty?
      ""
    else
      completed_test + level
    end
  end
  
  def ones(num)
    hash = {1 => "one", 2 => "two", 3 => "three", 
      4 => "four", 5 => "five", 6 => "six", 7 => "seven",
      8 => "eight", 9 => "nine", 10 => "ten"}
    hash[num]
  end
  
  def teens(num)
    hash = {11 => "eleven", 12 => "twelve", 13 => "thirteen",
      14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
      17 => "seventeen", 18 => "eighteen",  19 => "nineteen"}
    hash[num]
  end
  
  def tens(num)
    hash = {2 => "twenty ", 3 => "thirty ", 4 => "forty ", 
      5 => "fifty ", 6 => "sixty ", 7 => "seventy ",
      8 => "eighty ", 9 => "ninety "}
    hash[num]
  end
  
  def in_words
    return "zero" if number == 0
    number_in_words = tens_place(number) + ones_place(number)
    number_in_words.gsub("  ", " ").strip.gsub(" ", "-")
  end
end

class BeerSong 
  attr_reader :num_of_beers
  
  def initialize(beers)
    @num_of_beers = beers > 99 ? 99 : beers
  end
  
  def print_song
    return "" if num_of_beers < 1
    (1..num_of_beers).to_a.reverse.each do |num|
      translated_number = TranslateNum.new(num).translated.capitalize
      one_smaller = TranslateNum.new(num - 1).translated.capitalize
      if num < 2
        puts "#{translated_number} bottle of beer on the wall,"
        puts "#{translated_number} bottle of beer,"
        puts "Take one down, pass it around,"
        puts "#{one_smaller} bottles of beer on the wall."
      elsif num == 2
        puts "#{translated_number} bottles of beer on the wall,"
        puts "#{translated_number} bottles of beer,"
        puts "Take one down, pass it around,"
        puts "#{one_smaller} bottle of beer on the wall."
      else 
        puts "#{translated_number} bottles of beer on the wall,"
        puts "#{translated_number} bottles of beer,"
        puts "Take one down, pass it around,"
        puts "#{one_smaller} bottles of beer on the wall."
      end
    end
  end
end



