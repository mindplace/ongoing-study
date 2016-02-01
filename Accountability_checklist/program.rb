class CreateList 
    attr_reader :list
    
    def initialize
        @list = []
    end

    def get_the_items
        puts "\nOk, let's make your accountability list.\n\n"
        puts "Enter each item. When you've put in your last item,"
        puts "press enter on an empty line to finish.\n\n"
        puts "Please enter a personal daily standard:\n\n"
        standard = gets.chomp
        while true
            break if standard.empty?
            @list << standard
            puts "\nEnter another:\n\n"
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
        puts "Username is #{username}.\n\n"
        push_to_file(username)
        username
    end
end

class DataParsing
end

class Checklist
    attr_reader :username, :checklist
    attr_accessor :standards_met, :standards_unmet
    def initialize(username, checklist=nil)
        @username = username
        @checklist = checklist.nil? ? get_list : checklist
        @standards_met = []
        @standards_unmet = []
    end

    def get_list
        file_name = username + ".txt"
        list = File.readlines(file_name).map(&:chomp)
        list.nil? ? "No list found" : list
    end
    
    def export_to_tracker
        file_name = username + "_tracker.txt"
        date = Time.now.to_s.split[0].split("-").reverse.join("/")
        File.open(file_name, "a") do |line|
            line.puts "[#{date}, #{standards_met}, #{standards_unmet}]"
        end
    end
    
    def daily_review
        puts "Found your list."
        puts "For every item, write 'y' or 'n' to respond.\n\n"
        checklist.each do |item|
            puts item
            answer = gets.chomp
            if answer.include?("y")
                @standards_met << item
            else
                @standards_unmet << item
            end
        end
        a = checklist.length
        b = standards_met.length
        puts "Today's accountability score: #{b}/#{a}"   
        export_to_tracker
    end
end


if __FILE__ == $PROGRAM_NAME
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
end


