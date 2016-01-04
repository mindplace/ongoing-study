# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

class GreedGame
    def welcome
        puts "   _____   _____    ______   ______   _____   "
		puts "  / ____| |  __ \\  |  ____| |  ____| |  __ \\  "
		puts " | |  __  | |__) | | |__    | |__    | |  | | "
		puts " | | |_ | |  _  /  |  __|   |  __|   | |  | | "
		puts " | |__| | | | \\ \\  | |____  | |____  | |__| | "  
		puts "  \\_____| |_|  \\_\\ |______| |______| |_____/  "
		puts " "
    end
    
    def rules
        puts "rules"
    end
    
    def lost
        puts ".   . .___ .   . ._____.   ._____. . .      . .___       "
        puts "|\\  | |     \\ /     |         |    | |\\    /| |          "
        puts "| \\ | |---   X      |         |    | | \\  / | |---       "
        puts "|  \\| |___  / \\     |         |    | |  \\/  | |___ o o o "
        puts " "
        puts "Thanks for playing, #{$user_player} :)" 
        puts " "
    end
    
    def gameplay
       # welcome
       welcome
       puts "Shall we look at the rules? (yes or no)"
       answer = gets.chomp.downcase
       answer == "yes" ? rules : "Ok, here we go!"
       
       # user gets added to the game
       user = UserPlayer.new
       user.enters_game
       
       # other players get added
       user.introduce_others
       
       # number of rounds are established
       user.rounds
       
       # game starts:
       # for each round, player is introduced, player rolls, player gets score
       # round winner(s) announced
       # next round is called
       game = GamePlay.new
       game.playing
       
       # after all rounds, rounds are scored, winner announced
       game.scoring
       
       # goodbye
       # if user won, return won message
       # elsif user lost, return lost message
    end
end

class GamePlay < GreedGame
    def initialize
        @game
    end
     
    def round(player)
        player_set = DiceSet.new
        player_roll = player_set.roll.join(", ")
        puts "#{player} rolls #{player_roll}"
        player_score = player_set.score
        puts "#{player}'s score is #{player_score}"
        [player, player_score]
    end
    
    def winner(round)
       best_score = round.sort_by{|set| set[1]}
       best_score = best_score.select{|set| set[1] == best_score.last[1]}
       if best_score.length == 1
           return [best_score[0]]
       elsif 
           winners = best_score.map{|set| set[0]}
           return [winners]
       end
    end
    
    def round_name(num)
        hash = {1 => "first", 2 => "second", 3 => "third", 4 => "fourth", 5 => "fifth",
            6 => "sixth", 7 => "seventh", 8 => "eigth", 9 => "ninth", 10 => "tenth"}
        hash[num]
    end
    
    def playing
        @@round_winners = []
        while @@round_winners.length < $round_total
            new_round = []
            puts "This is the #{round_name(@@round_winners.length + 1)} round!"
            puts "You start the round."
            new_round << round($user_player)
            $players.each do |player|
                puts "Now it's #{player}'s turn."
                new_round << round(player)
            end
            @@round_winners << winner(new_round)
            if @@round_winners.last[0].length == 1
                puts "#{@@round_winners.last[0][0]} wins the round, with #{@@round_winners.last[0][1]} points!"
            else
                tied_score = @@round_winners.last[0][1]
                winners = @@round_winners.last.flatten.reject{|item| item =~ /[0-9+]/}
                puts "#{winners.join(", ")} tie for the round at #{tied_score} points!"
            end
        end
    end
    
    def scoring
       total = @@round_winners.map{|set| set[0]}
       total = total.sort_by{|name| total.count(name)}
       total = total.select{|name| total.count(name) == total.count(total.last)}.uniq
       if total.length == 1
           puts "#{total.join} wins!!!"
       elsif total.length == 2
           puts "#{total.join(" and ")} tie!!!"
       else
           puts "#{total.join(", ")} all tie!!!"
       end
    end
end

class Players < GreedGame
    $players = []
    $user_player = ""
    
    def initialize(name)
        @player = name
        $players << @player
    end
    
    def user_player(name)
        $user_player = name
        $players.delete($user_player)
    end
end

class UserPlayer < GreedGame
   def initialize
        @user_player
   end
    
   def enters_game
       puts "Ready to play? Give us a name."
       @@name = gets.chomp.capitalize
       user = @@name
       user = Players.new(user)
       user.user_player(@@name)
   end
   
   def introduce_others
      player_names = ["Hamish", "Claire", "Dougal", "KoolAidMan", "POTUS", "octopus", "GrumpyCat"]
      greeting = ["'hi!'", "'hello there.'", "'howdy :)'", "'grumble grumble.'", "'good day to you!'", "'HAPPY WEDNESDAY!!!'"]
      player_number = rand(2..4)
      puts "#{player_number} players decide to join the game!"
      player_names = player_names.sample(player_number)
      player_names.each{|player| player = Players.new(player)}
      $players.each do |player|
          puts "#{player} enters the game and says #{greeting.sample(1).join}"
      end
   end
   
   def rounds
       puts "From 1 to 10 rounds, how many rounds do you want to play, #{@@name}?"
       $round_total = gets.chomp.to_i
       puts "Great, everyone agrees to play #{$round_total} rounds."
   end
end

class DiceSet < GamePlay
  def initialize
    @dice
  end
  
  def roll
    returning = []
    5.times{returning << rand(1..6)}
    @dice = returning
  end
  
  def score
    dice = @dice
    dice = dice.sort
    result = 0
    
    if dice.select{|num| dice.count(num) >= 3}.length > 0
        triplet = dice.select{|x| dice.count(x) > 2}
        triplet_indexes = []
        dice.each_with_index do |num, i|
            triplet_indexes << i if triplet.include?(num)
        end
        while triplet_indexes.length > 3 
            triplet_indexes.delete(triplet_indexes.last)
        end
        triplet_indexes.each do |index|
            dice[index] = nil
        end
        dice = dice.compact
        if triplet[0] == 1
            result += 1000
        else
            result += triplet[0] * 100
        end
        if dice.include?(1)
            amount = dice.select{|num| num == 1}.length
            result += amount * 100
            if dice.include?(5)
                amount = dice.select{|num| num == 5}.length
                result += amount * 50
            end
        elsif dice.include?(5)
            amount = dice.select{|num| num == 5}.length
            result += amount * 50
        end
    elsif dice.include?(1)
        amount = dice.select{|num| num == 1}.length
        result += amount * 100
        if dice.include?(5)
            amount = dice.select{|num| num == 5}.length
            result += amount * 50
        end
    elsif dice.include?(5)
        amount = dice.select{|num| num == 5}.length
        result += amount * 50
    end
    result
  end
end

new_game = GreedGame.new
new_game.gameplay