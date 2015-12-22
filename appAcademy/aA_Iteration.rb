# Loop through all the numbers, stopping when you encounter a number that is 
# (a) >250 and (b) divisible by 7. Print this number down!

def ridiculous_loop
    (1..100000000).each do |num|
        if (num > 250) && (num % 7 == 0)
            puts num
            break
        end
    end
end

# ridiculous_loop

# Print out all the factors for each of the numbers 1 through 100.


# Implement Bubble sort in a method #bubble_sort that takes an Array and 
# modifies it so that it is in sorted order. 
# Bubble sort, sometimes incorrectly referred to as sinking sort, is a simple sorting algorithm 
# that works by repeatedly stepping through the list to be sorted, comparing each pair of adjacent 
# items and swapping them if they are in the wrong order. The pass through the list is repeated until 
# no swaps are needed, which indicates that the list is sorted. The algorithm gets its name from the way 
# smaller elements "bubble" to the top of the list. Because it only uses comparisons to operate on elements, 
# it is a comparison sort. Although the algorithm is simple, most other algorithms are more efficient for sorting large lists.

def bubble_sort(array)
    while array != array.sort
        array.each do |num|
            break if num == array.last
            second_num = array[array.index(num) + 1]
            if num > second_num
                array.insert(array.index(second_num), array.delete_at(array.index(num)))
            end
        end
    end
    "#{array.join(", ")}"
end

#puts bubble_sort([5, 4, 3, 2, 1])

# Write a method substrings that will take a String and return an array containing 
# each of its substrings. 
# Example output: substrings("cat") => ["c", "ca", "cat", "a", "at", "t"]

def subber(string)
    string_array = []
    starting_index = 0
    while starting_index < string.length
        string.split("").each_with_index do |letter, index| 
            string_array << string.slice(starting_index..index)
        end
        starting_index += 1
    end
   "[#{string_array.reject{|l| l.empty?}.uniq.join(", ")}]"
end

#puts subber("cat")
#puts subber("puppy")