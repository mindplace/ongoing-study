# Prime Time
# Determine if a given number is prime.

def PrimeTime(num)
  (2..num).to_a.select{|x| num % x == 0} == [num]     
end

# Run Time
# have the function RunLength(str) take the str parameter being passed and 
# return a compressed version of the string using the Run-length encoding 
# algorithm. This algorithm works by taking the occurrence of each repeating 
# character and outputting that number along with a single character of the 
# repeating sequence. For example: "wwwggopp" would return 3w2g1o2p. The 
# string will not contain any numbers, punctuation, or symbols. 

def RunLength(str)
  str = str.split("")
  new_string = []
  count = 1
  str.each_with_index do |char, i|
    if i > 0
        count += 1 if char == str[i - 1]
    end
    if char != str[i + 1]
      new_string << count.to_i
      new_string << char
      count = 1
    end
  end
  new_string.join
end

#puts RunLength("a") # should == "1a"
#puts RunLength("abqq") # should == "1a1b2q"
#puts RunLength("coolthree") # should == "1c2oo1l1t1h1r2e"

# Prime Mover
# have the function PrimeMover(num) return the numth prime number. The range 
# will be from 1 to 10^4. For example: if num is 16 the output should be 
# 53 as 53 is the 16th prime number. 

def PrimeMover(num)
  range = [0, 0, 2]
  (3..10000).each do |number|
    number.odd? ? (range << number) : (range << 0)
  end
  i = range[3]
    while true
      (i*i).step(10000, i) do |number|
        range[number] = 0
       end
       break if range[0..i].select{|item| item > 0}.count == num
       i = range.find{|number| (number > i)}
       break if i == nil
    end
  range = range.select{|item| item > 0}
  range[num - 1]
end

#puts PrimeMover(9) # should == 23
#puts PrimeMover(100) # should == 541


# Palindrome Two
# have the function PalindromeTwo(str) take the str parameter being passed 
# and return the string true if the parameter is a palindrome, (the string 
# is the same forward as it is backward) otherwise return the string false. 
# The parameter entered may have punctuation and symbols but they should 
# not affect whether the string is in fact a palindrome. For example: "Anne, 
# I vote more cars race Rome-to-Vienna" should return true. 

def PalindromeTwo(str)
  str = str.downcase.split("").reject{|char| char !~ /[a-z]/}
  str == str.reverse
end

# Division
# have the function Division(num1,num2) take both parameters being passed and 
# return the Greatest Common Factor. That is, return the greatest number that 
# evenly goes into both numbers with no remainder. For example: 12 and 16 both 
# are divisible by 1, 2, and 4 so the output should be 4. The range for both 
# parameters will be from 1 to 10^3. 

def factors(num)
  (1..num).to_a.select{|item| num % item == 0}
end

def Division(num1,num2)
	num1 = factors(num1)
  num2 = factors(num2)
  mutual = (num1 + num2)
  mutual.select{|num| mutual.count(num) > 1}.sort[-1]
end

# String Scramble
# have the function StringScramble(str1,str2) take both parameters being passed 
# and return the string true if a portion of str1 characters can be rearranged 
# to match str2, otherwise return the string false. For example: if str1 is 
# "rkqodlw" and str2 is "world" the output should return true. Punctuation and 
# symbols will not be entered with the parameters. 

def StringScramble(str1,str2)
  str1 = str1.split("")
  testing = str2.split("")
  str2.split("").each do |char|
    if str1.include?(char)
      str1.delete(char)
      testing.delete(char)
    end
  end
  testing.empty?
end

# puts StringScramble("h3llko", "hllo") #should == true


# Arith Geo II
# have the function ArithGeoII(arr) take the array of numbers stored in arr and 
# return the string "Arithmetic" if the sequence follows an arithmetic pattern or 
# return "Geometric" if it follows a geometric pattern. If the sequence doesn't 
# follow either pattern return -1. An arithmetic sequence is one where the difference 
# between each of the numbers is consistent, where as in a geometric sequence, each term 
# after the first is multiplied by some constant or common ratio. Arithmetic example: 
# [2, 4, 6, 8] and Geometric example: [2, 6, 18, 54]. Negative numbers may be entered as 
# parameters, 0 will not be entered, and no array will contain all the same elements. 

def arithmetic?(array)
  slices = []
  array.each_with_index do |num, i|
    break if i == array.index(array.last)
    slices << array[i + 1] - array[i]
  end
  slices.uniq.length == 1 ? true : false
end

def geometric?(array)
  slices = []
  array.each_with_index do |num, i|
    break if i == array.index(array.last)
    slices << array[i + 1] / array[i]
  end
  slices.uniq.length == 1 ? true : false
end

def ArithGeoII(arr)
  if (geometric?(arr) == false) && (arithmetic?(arr) == false)
    return "-1"
  elsif (arithmetic?(arr) == true)
    return "Arithmetic"
  elsif (geometric?(arr) == true)
    return "Geometric"
  end
end

#puts ArithGeo([5,10,15,20]) # should == "Arithmetic"
#puts ArithGeo([2,4,8,16]) # should == "Geometric"

#Array Addition
# have the function ArrayAddition(arr) take the array of numbers stored in arr and 
# return the string true if any combination of numbers in the array can be added up 
# to equal the largest number in the array, otherwise return the string false. For 
# example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true 
# because 4 + 6 + 10 + 3 = 23. The array will not be empty, will not contain all the 
# same elements, and may contain negative numbers. 

def ArrayAddition(arr)
  largest = arr.sort.last
  arr = arr.sort[0..-2]
  slices = []
  (2..(arr.size)).each do |num|
    slices << arr.combination(num).map{|item| item.inject(:+)}
   end
   slices.flatten.include?(largest)
end

#puts ArrayAddition([4, 6, 23, 10, 1, 3]) #should == true
#puts ArrayAddition([3,5,-1,8,12]) #should == true
#puts ArrayAddition([10,20,30,40,100]) # should == true

# Binary Converter
# have the function BinaryConverter(str) return the decimal form of the binary 
# value. For example: if 101 is passed return 5, or if 1000 is passed return 8. 

def BinaryConverter(str)
	str.to_i(2)   
end

# Letter Count
# have the function LetterCount(str) take the str parameter being passed and 
# return the first word with the greatest number of repeated letters. For example: 
# "Today, is the greatest day ever!" should return greatest because it has 2 e's 
# (and 2 t's) and it comes before ever which also has 2 e's. If there are no words 
# with repeating letters return -1. Words will be separated by spaces. 

def LetterCount(str)
  sentence = str.split
  biggest_repeated_word = ""
  biggest_count = 0
  sentence.each do |word|
    count = word.downcase.split("").length
    newcount = word.downcase.split("").uniq.length
    if ((count - newcount) > 0) && (biggest_count < (count - newcount))
        biggest_count = (count - newcount)
        biggest_repeated_word = word
    end
  end
  biggest_repeated_word.empty? ? -1 : (sentence[sentence.index(biggest_repeated_word)] || sentence[sentence.index(biggest_repeated_word.capitalize)])
end

# Caesar Cipher
# take a string and offset num and return the Caesar cipher of the original string.

def CaesarCipher(str,num)
  letter_array = str.downcase.split("")
  returning = ""
  letter_array.each_with_index do |letter, i|
    new_letter = letter.ord + num
    if new_letter > 122
      new_letter = (new_letter - 26).chr
      new_letter = new_letter.upcase if str[i] == str[i].upcase
      returning += new_letter
    elsif letter !~ /[a-z]/
      returning += letter
    else
      new_letter = new_letter.chr
      new_letter = new_letter.upcase if str[i] == str[i].upcase
      returning += new_letter
    end
  end
  returning
end

#puts CaesarCipher("Hello",4) # Should == "Lipps"
# puts CaesarCipher("Caesar Cipher", 2) # should == "Ecguct Ekrjgt"

# Simple Mode
# have the function SimpleMode(arr) take the array of numbers stored in arr and return 
# the number that appears most frequently (the mode). For example: if arr contains 
# [10, 4, 5, 2, 4] the output should be 4. If there is more than one mode return the one 
# that appeared in the array first (ie. [5, 10, 10, 6, 5] should return 5 because it 
# appeared first). If there is no mode return -1. The array will not be empty. 

def SimpleMode(arr)
  mode = arr.sort_by{|num| arr.count(num)}.last
  arr.count(mode) > 1 ? mode : -1
end

# Consecutive
# Return the number of items needed to be added to the given array in order to create 
# a list of consecutive items. E.g. given an array of [2,4,6], Consecutive(arr) should
# return 2, because the array is missing [3,5] in order to be a consecutive list.

def Consecutive(arr)
	arr = arr.sort
  consecutive = (arr[0]..arr[-1]).to_a
  (consecutive - arr).length
end

#puts Consecutive([5,10,15]) # should == 8

# Formatted Division
# have the function FormattedDivision(num1,num2) take both parameters being passed, divide 
# num1 by num2, and return the result as a string with properly formatted commas and 4 
# significant digits after the decimal place. For example: if num1 is 123456789 and num2 is 
# 10000 the output should be "12,345.6789". The output must contain a number in the one's place 
# even if it is a zero. 

def from_scratch_rounding(float)
  return ".0000" if float == float.to_i
  decimal = float - float.to_i
  decimal = "." + (decimal * 10000).round.to_s
end

def FormattedDivision(num1,num2)
  result = num1.to_f / num2.to_f
  before_decimal = (num1 / num2).to_s
  after_decimal = from_scratch_rounding(result)
  
  if before_decimal.length > 3
    if before_decimal.length > 6
      before_decimal = before_decimal.insert(-7, ",")
    end
    before_decimal = before_decimal.insert(-4, ",")
  end
  
  before_decimal + after_decimal
end


#puts FormattedDivision(8,8) # should == 1.0000
#puts FormattedDivision(2, 3) # should == 0.6667
#puts FormattedDivision(123456789, 10000) # should == "12,345.6789"


# Permutation Step
# have the function PermutationStep(num) take the num parameter being passed and 
# return the next number greater than num using the same digits. For example: if 
# num is 123 return 132, if it's 12453 return 12534. If a number has no greater 
# permutations, return -1 (ie. 999). 

def PermutationStep(num)
  return -1 if num.to_s.split("").uniq.length == 1
  combo_array = []
  combo_array << num.to_s.split("").permutation.map{|set| set.join.to_i}
  combo_array << num
  combo_array = combo_array.flatten.uniq.sort
  num_index = combo_array.index(num)
  combo_array[num_index] == combo_array.last ? -1 : combo_array[num_index + 1]
end

#puts PermutationStep(11121) # should == 11211
#puts PermutationStep(41352) # should == 41523
#puts PermutationStep(8) # should == -1

#Prime Checker
# Have the function PrimeChecker return 1 if a permutation of a given num results in one
# or more prime numbers.

def PrimeChecker(num)
  perm_array = []
  perm_array << num.to_s.split("").permutation.map{|set| set.join.to_i}
  perm_array << num
  perm_array = perm_array.flatten.uniq.sort
  
  primes = []
  perm_array.each do |number|
    if (2..number).to_a.reject{|x| number % x != 0} == [number]
      primes << number
    end
  end
  primes.empty? ? 0 : 1
end

#puts PrimeChecker(8) # should == 0
#puts PrimeChecker(98) # should == 1

# Dash Insert II
# have the function DashInsertII(str) insert dashes ('-') between each two odd numbers 
# and insert asterisks ('*') between each two even numbers in str. For example: if str 
# is 4546793 the output should be 454*67-9-3. Don't count zero as an odd or even number. 

def DashInsertII(num)
  num = num.to_s.split("")
  returning = ""
  num.each_with_index do |x, i|
    returning << x
    break if i == num.length - 1
    if (x.to_i % 2 == 0) && (num[i + 1].to_i % 2 == 0) && (x.to_i != 0) && (num[i + 1].to_i != 0)
      returning << "*"
    elsif (x.to_i % 2 != 0) && (num[i + 1].to_i % 2 != 0) 
      returning << "-"
    end
  end
  returning
end

# puts DashInsertII(56647304) # should == 56*6*47-304

# Swap II
# have the function SwapII(str) take the str parameter and swap the case of each character. 
# Then, if a letter is between two numbers (without separation), switch the places of the 
# two numbers. For example: if str is "6Hello4 -8World, 7 yes3" the output should be 4hELLO6 -8wORLD, 7 YES3. 

def SwapII(str)
  sentence = str.split
  returning = []
  sentence.each do |word|
    word = word.split("")
    new_word = ""
    
    first_num_i = 0
    first_num = ""
    second_num_i = 0
    second_num = ""
    
    word.each_with_index do |item, i|
      if word.length == 1
        new_word << item
        next
      end
      if item.to_i > 0 && second_num.empty? && word[i + 1].to_i == 0
        second_num_i = i
        second_num << item
        next
      elsif item.to_i > 0 && first_num.empty? && word[i + 1].to_i == 0
        first_num_i = i
        first_num << item
        next
      end
      new_word << item.swapcase
    end
    
    if new_word.length == 1
      returning << new_word 
      next
    elsif first_num.empty? == false && second_num.empty? == false
      new_word = new_word.insert(second_num_i, first_num)
        if second_num.empty? == false && first_num.empty? == false
          new_word = new_word.insert(first_num_i, second_num)
        end
      returning << new_word
    elsif second_num.empty? == false && first_num.empty? == true
      new_word = new_word.insert(second_num_i, second_num)
      returning << new_word
    else
      returning << new_word
    end
  end
  
  returning.join(" ")
end

#puts SwapII("Hello -5LOL6") # should == "hELLO -6lol5"
#puts SwapII("6Hello4 -8World, 7 yes3") # should == "4hELLO6 -8wORLD, 7 YES3"
#puts SwapII("i love cAke33&") # should == "i LOVE CaKE33&"
#puts SwapII("123gg))((") # should == "123GG))(("