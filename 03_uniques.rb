# Write a method uniques which takes an array of items and returns the array 
# without any duplicates. Don’t use Ruby’s uniq method!

def uniques(array)
    returning = []
    array = array.map{|i| i.to_s}.sort
    array.each_with_index do |item, index| 
        if index == 0
            returning << item
        else 
            returning << item if item != array[index - 1]
        end
    end
    "[#{returning.join(", ")}]"
end