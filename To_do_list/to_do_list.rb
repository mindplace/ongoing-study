# To do list
# 
# This program prompts the user to enter each of the
# things they have to do today. Then it offers to save 
# the list for them in a new .txt file.

def get_the_items
    to_do_list = []
    puts "Your to-do list!"
    puts "Enter each item. When you've put in your last item,"
    puts "press enter on an empty line to finish."
    puts "Press enter to get started."
    gets
    while true
        puts "Please enter a task."
        task = gets.chomp
        break if task.empty?
        to_do_list << task
        puts "Got it."
    end
    to_do_list
end

def put_list(to_do_list)
    puts "Ok! Here is your list:"
    to_do_list.each do |item|
	    puts "#{(to_do_list.index(item)).to_i + 1}. #{item}"
    end
end

def heading
   date = Time.now.to_s.split[0]
   "#{date}\n
Today's to-do list:\n\n"
end

def push_to_file(to_do_list)
    puts "Sure! What should the filename be?"
    name = gets.chomp
    file_name = name + ".txt"
    
    exported_list = File.new(file_name, "w")
    exported_list << heading
    to_do_list.each_with_index do |item, i|
        exported_list << "#{i + 1}. #{item}\n"
    end
    puts "Your to-do list is now in #{file_name}." 
end

def create_to_do_list
    to_do_list = get_the_items
    puts "Would you like to save your list in a file, yes or no?"
    answer = gets.chomp.downcase
    if answer == "yes"
        push_to_file(to_do_list)
    else
        put_list(to_do_list)
    end
    puts "Have a great day :)"
end

create_to_do_list
