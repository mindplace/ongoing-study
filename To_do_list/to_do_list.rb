def get_number_of_items
    puts "How many things do you have to do today?" 
    number_of_items = gets.chomp.to_i
    while number_of_items.to_i == 0 
        puts "That’s not a number. Please tell me how many things you have to do today." 
        number_of_items = gets.chomp.to_i
    end
    number_of_items
end

def get_the_items(number_of_items)
    to_do_list = []
    number_of_items.times do |item|
        puts "Got it."
        puts "Please enter a task."
        to_do_list << gets.chomp
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
    number_of_items = get_number_of_items
    to_do_list = get_the_items(number_of_items)
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
