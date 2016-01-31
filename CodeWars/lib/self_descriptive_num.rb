def self_descriptive(num)
  num_array = num.to_s.chars.map(&:to_i)
  descriptive = []
  i = 0
  while i < num_array.length
    current = num.to_s[i].to_i
    if num_array.count(i) == current
      descriptive << true
    else
      descriptive << false
    end
    i += 1
  end
  descriptive.include?(false) ? false : true
end

puts self_descriptive(21200)