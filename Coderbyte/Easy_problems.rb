




### Counting Minutes I
# have the function CountingMinutesI(str) take the str parameter being passed which 
# will be two times (each properly formatted with a colon and am or pm) separated by a 
# hyphen and return the total number of minutes between the two times. The time will 
# be in a 12 hour clock format. For example: if str is 9:00am-10:00am then the output 
# should be 60. If str is 1:00pm-11:00am the output should be 1320.

def to_military(num, letter)
  if letter == "p"
      if num < 12
        hour = (num + 12).to_s
      else 
        hour = num.to_s
      end
      return hour
  elsif letter == "a"
      if num != 12
        hour = num.to_s
      else
        hour = "24"
      end
      return hour
  end
end

def CountingMinutesI(str)
  array = str.split("-")
  array.map! do |item|
    item.index(":") != 2 ? item.insert(0, "0") : item
  end
  
  first = ""
  second = ""
  array.each do |item|
    if array.index(item) == 0 
      item = item.split("").reject{|char| char == ":"}
      hours = (item.include?("p") ? to_military(item[0..1].join.to_i, "p") : to_military(item[0..1].join.to_i, "a"))
      minutes = (item[2..3]).join.to_s
      first = (hours.to_s + minutes).to_i
    elsif array.index(item) == 1
      item = item.split("").reject{|char| char == ":"}
      hours = (item.include?("p") ? to_military(item[0..1].join.to_i, "p") : to_military(item[0..1].join.to_i, "a"))
      minutes = (item[2..3]).join.to_s
      second = (hours.to_s + minutes).to_i
    end
  end
  difference = 0
  second += 2400 if first > second
  
  if second > first
    difference = ((second - first) / 100) * 60
    difference += first.to_s[2..3].to_i
  end
  
  difference
end

#puts CountingMinutesI("1:23am-1:08am") #should == 1383
#puts CountingMinutesI("12:30pm-12:00am") #should == 690
#puts CountingMinutesI("1:00pm-11:00am") #should == 1320



## Mean Mode
# have the function MeanMode(arr) take the array of numbers stored in arr and 
# return 1 if the mode equals the mean, 0 if they don't equal each other 
# (ie. [5, 3, 3, 3, 1] should return 1 because the mode (3) equals the mean (3)). 
# The array will not be empty, will only contain positive integers, 
# and will not contain more than one mode. 

def MeanMode(arr)
  mode = arr.sort_by{|num| arr.count(num)}.last
  mean = arr.inject(:+) / arr.length
  mode == mean ? 1 : 0
end

# Dash Insert
# have the function DashInsert(str) insert dashes ('-') between each two odd 
# numbers in str. For example: if str is 454793 the output should be 4547-9-3. 
# Don't count zero as an odd number.

def DashInsert(str)
  str = str.to_s if str.class == Fixnum 
  array = str.split("").map{|num| num.to_i}
  new_string = ""
  array.each_with_index do |num, i|
    new_string << num.to_s
    break if i == array.index(array.last)
    if (num != 0) && (num % 2 != 0) && (array[i + 1] != 0) && (array[i + 1] % 2 != 0)
      new_string << "-"
    end
  end
  new_string
end

#puts DashInsert(99946) #Output = 9-9-946
#puts DashInsert("56730") #Output = 567-30

#