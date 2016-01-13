# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers
  
  def initialize
    @towers = [[3, 2, 1], [], []]
    @moves_count = 0
  end

  def towers
    @towers
  end
  
  def moves_count
    @moves_count
  end
  
  def rules
    puts "
      The Towers of Hanoi is a mathematical game or puzzle. It consists of 
      three rods and three disks of different sizes which can slide onto any 
      rod. The puzzle starts with the disks in a stack of descending sizes 
      on the leftmost rod.

      Move the entire stack to the rightmost rod under these rules:

        1. Only one disk can be moved at a time.
        2. Each move consists of taking the upper disk from one of the stacks 
           and placing it on top of another stack i.e. a disk can only be moved 
           if it is the uppermost disk on a stack.
        3. No disk may be placed on top of a smaller disk.
    "
  end
  
  def offer_rules
    puts "Want to see the rules?"
    puts "(yes/no)"
    user_answer = gets.chomp
    rules if user_answer == "yes"
    puts "Press enter to play!"
    gets
  end
  
  def get_sets_for_rendering
    sets = towers.map do |column| 
      if column.empty? 
        column = [" ", " ", " "]
      elsif column.length < 3 && column.length > 1
        column << " "
      elsif column.length < 2 
        column << " "
        column << " "
      else
        column
      end
    end
    @towers = @towers.map{|column| column.reject{|x| x == " "} }
    sets
  end
  
  def render
    sets = get_sets_for_rendering
    puts "1st|2nd|3rd"
    puts " #{sets[0][2]} | #{sets[1][2]} | #{sets[2][2]}"
    puts " #{sets[0][1]} | #{sets[1][1]} | #{sets[2][1]}"
    puts " #{sets[0][0]} | #{sets[1][0]} | #{sets[2][0]}"
  end
  
  ####
  
  def desired_move
    choice = disk
    disk = choice[1]
    from_tower = choice[0]
    [disk, from_tower, to_tower]
  end
  
  def move(disk, from_tower, to_tower)
    from_tower.delete(disk)
    to_tower << disk
  end

  def locate(disk)
    if towers[0].include?(disk)
      @towers[0]
    elsif towers[1].include?(disk)
      @towers[1]
    else
      @towers[2]
    end
  end
  
  def disk
    puts "Which disk would you like to move?"
    disk = gets.chomp.to_i
    
    if disk == 0 || disk > 3
      while disk == 0
        puts "Didn't catch that?"
        disk = gets.chomp.to_i
      end
      while disk > 3
        puts "There's no such disk, choose another."
        disk = gets.chomp.to_i
      end
    end
    
    from_tower = locate(disk)
    
    while from_tower.last != disk
      puts "Can't take a disk if it's not at the top!"
      puts "Choose another disk to move."
      disk = gets.chomp.to_i
      from_tower = locate(disk)
    end
    [from_tower, disk]
  end
  
  def to_tower 
    to_tower = nil
    while to_tower == nil
      puts "To which tower?"
      to_tower = gets.chomp.to_i
      to_tower = towers[to_tower - 1]
      break if to_tower != nil
      puts "There's no such tower, choose another."
    end
    to_tower
  end
  
  def valid_move?(disk, to_tower)
    comparator = to_tower.last.to_i
    comparator < disk && comparator > 0 ? false : true
  end
  
  def turn_invalid_move_valid(disk)
    user_choice = next_disk_is_smaller_error(disk)
    user_choice == 1 ? 1 : to_tower
  end
  
  def next_disk_is_smaller_error(selection)
    puts "Can't move the disk there, the next disk at that tower"
    puts "is smaller than the disk you selected."
    puts "You can choose another disk or choose another tower"
    puts "for disk ##{selection}."
    puts "Enter 1 to choose another disk, or 2 to choose another tower:"
    choice = gets.chomp.to_i
    while choice != 1 && choice != 2
      puts "Didn't catch that?"
      choice = gets.chomp.to_i
    end
    choice
  end
  
  def playing_loop
    while won? == false
      puts "Here are the towers and their disks:\n\n"
      render
      puts "\n"
      user_makes_move = desired_move
      disk = user_makes_move[0]
      from_tower = user_makes_move[1]
      to_tower = user_makes_move[2]
      
      while valid_move?(disk, to_tower) == false
          user_choice = turn_invalid_move_valid(disk)
          user_choice == 1 ? break : to_tower = user_choice
      end
      
      if valid_move?(disk, to_tower)
        move(disk, from_tower, to_tower)
        @moves_count += 1
      end
    end
  end
  
  def play
    puts "Welcome to the game!"
    offer_rules
    playing_loop
    winning_message
  end
  
  def won?
    @towers == [[], [], [3, 2, 1]]
  end
  
  def winning_message
    puts "\n"
    puts "You won!!"
    puts "\n"
    render
    puts "\n"
    puts "You finished the game in #{moves_count} moves!"
    puts "Thanks for playing :)"
  end
  
end

game = TowersOfHanoi.new
game.play