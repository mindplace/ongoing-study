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

