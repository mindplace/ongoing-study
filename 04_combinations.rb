# Write a method combinations which takes two arrays of strings and 
# returns an array with all of the combinations of the items in them, 
# listing the first items first.

def combinations(first, second)
    combined = []
    first.each do |part_one| 
        second.each do |part_two|
            combined << part_one + part_two
        end
    end
    "[#{combined.join(",")}]"
end