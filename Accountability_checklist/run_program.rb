require_relative 'checklist'
require_relative 'create_list'
require_relative 'data_parsing'
 
puts "Accountability checklist"
puts "Press enter to start review, or type 'n' to make a new list:"
answer = gets.chomp

if answer.include?("n")
    list = CreateList.new
    username = list.create_list
    checklist = list.list
    today = Checklist.new(username, checklist)
else
    puts "Username?"
    username = gets.chomp
    today = Checklist.new(username)
end

today.daily_review