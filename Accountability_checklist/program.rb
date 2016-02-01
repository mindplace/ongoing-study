class CreateList < Checklist
    attr_reader :list
    
    def initialize
        @list = []
    end

    def get_the_items
        puts "Ok, let's make your accountability list.\n"
        puts "Enter each item. When you've put in your last item,"
        puts "press enter on an empty line to finish."
        puts "Press enter to get started:"
        gets
        puts "Please enter a personal daily standard:"
        standard = gets.chomp
        while true
            break if standard.empty?
            @list << standard
            puts "Enter another:"
            standard = gets.chomp
        end
    end

    def put_list
        list.each_with_index do |item, i|
	       puts "#{i + 1}. #{item}"
        end
    end

    def push_to_file(username)
        file_name = username + ".txt"
        exported_list = File.new(file_name, "w")
        list.each{|item| exported_list << "#{item}\n"}
    end

    def create_list
        get_the_items
        puts "Your list has been created:"
        put_list
        puts "You can use this list as your checklist every day,"
        puts "or create a new one whenever you wish.\n"
        puts "To access your list, let's set your username."
        puts "Enter a username:"
        username = gets.chomp
        puts "Username is #{username}."
        push_to_file(username)
        username
    end
end

class DataParsing < Checklist
end

class Checklist
    attr_reader :username, :checklist
    def initialize(username)
        @username = username
        @checklist = get_list
    end

    def get_list
        file_name = username + ".txt"
        list = File.readlines(file_name).map(&:chomp)
        list.nil? : raise "No list found" : list.group_by(&:itself)
    end
    
    def export_to_tracker
        # date, standards_met, standards_unmet 
    end
    
    def daily_review
        puts "For every item, write 'y' or 'n' to respond."
        
    end
end


if __FILE__ == $PROGRAM_NAME
  puts "Accountability checklist"
  puts "Press enter to start review, or type 'n' to make a new list:"
  answer = gets.chomp
  if answer.include?("n")
     list = CreateList.new
     username = list.create_list
  else
     puts "Username?"
     username = gets.chomp
  end
  today = Checklist.new(username)
  today.daily_review
end


