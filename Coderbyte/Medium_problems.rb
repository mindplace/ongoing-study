# Prime Time
# Determine if a given number is prime.

def PrimeTime(num)
  (2..num).to_a.select{|x| num % x == 0} == [num]     
end

# Run Time
# have the function RunLength(str) take the str parameter being passed and return a compressed version of the string using the Run-length encoding algorithm. This algorithm works by taking the occurrence of each repeating character and outputting that number along with a single character of the repeating sequence. For example: "wwwggopp" would return 3w2g1o2p. The string will not contain any numbers, punctuation, or symbols. 

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
# have the function PrimeMover(num) return the numth prime number. The range will be from 1 to 10^4. For example: if num is 16 the output should be 53 as 53 is the 16th prime number. 

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
# have the function PalindromeTwo(str) take the str parameter being passed and return the string true if the parameter is a palindrome, (the string is the same forward as it is backward) otherwise return the string false. The parameter entered may have punctuation and symbols but they should not affect whether the string is in fact a palindrome. For example: "Anne, I vote more cars race Rome-to-Vienna" should return true. 

def PalindromeTwo(str)
  str = str.downcase.split("").reject{|char| char !~ /[a-z]/}
  str == str.reverse
end

# Division
# have the function Division(num1,num2) take both parameters being passed and return the Greatest Common Factor. That is, return the greatest number that evenly goes into both numbers with no remainder. For example: 12 and 16 both are divisible by 1, 2, and 4 so the output should be 4. The range for both parameters will be from 1 to 10^3. 

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
# have the function StringScramble(str1,str2) take both parameters being passed and return the string true if a portion of str1 characters can be rearranged to match str2, otherwise return the string false. For example: if str1 is "rkqodlw" and str2 is "world" the output should return true. Punctuation and symbols will not be entered with the parameters. 

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


# Arith Geo
# have the function ArithGeoII(arr) take the array of numbers stored in arr and return the string "Arithmetic" if the sequence follows an arithmetic pattern or return "Geometric" if it follows a geometric pattern. If the sequence doesn't follow either pattern return -1. An arithmetic sequence is one where the difference between each of the numbers is consistent, where as in a geometric sequence, each term after the first is multiplied by some constant or common ratio. Arithmetic example: [2, 4, 6, 8] and Geometric example: [2, 6, 18, 54]. Negative numbers may be entered as parameters, 0 will not be entered, and no array will contain all the same elements. 
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

def ArithGeo(arr)
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
# have the function ArrayAddition(arr) take the array of numbers stored in arr and return the string true if any combination of numbers in the array can be added up to equal the largest number in the array, otherwise return the string false. For example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true because 4 + 6 + 10 + 3 = 23. The array will not be empty, will not contain all the same elements, and may contain negative numbers. 

def ArrayAddition(arr)
  largest = arr.sort.last
  arr = arr.sort[0..-2]
  slices = []
  (2..(arr.size)).each do |num|
    slices << arr.combination(num).map{|item| item.inject(:+)}
   end
   puts slices.flatten.sort.join(",")
   slices.flatten.include?(largest)
end

#puts ArrayAddition([4, 6, 23, 10, 1, 3]) #should == true
#puts ArrayAddition([3,5,-1,8,12]) #should == true
#puts ArrayAddition([10,20,30,40,100]) # should == true