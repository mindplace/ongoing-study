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
        puts "
        Greed is a dice game played by 2 or more players, using 
        regular dice. Players decide how many rounds they want 
        to play, then they take turns in each round. A player's
        turn consists of throwing 5 dice, then determining
        their score based on the resulting set of numbers. 

        Scoring:
        - if there are 3 of the same numbers in the set, that number 
          is multipled by 100 and added to the score. So 3 4s results 
          in 400, 3 5s results in 500, and so on; except 1s, which 
          result in 1000.
        - Aside from the triplet numbers, if the other numbers contain
          a 1, or are all 1s, the score adds 100 for each 1.
          If the other number or numbers contain a 5, or are all
          5s, the score adds 50 for each 5.
        - A single number can only be counted once in each set.
        
        After rolling the dice, the player can choose to take a chance
        and throw again the non-scoring dice. If throw #2 results 
        in more scoring dice, those values are added to their score. But
        if this new throw resuls in no scoring dice, their overall round 
        score is dropped to zero. If their score on throw #2 results in 
        some scoring and some non-scoring dice, they can choose again
        to throw the non-scoring dice for the chance to add to their
        round score, under the same caveat as before.
        
        Example:
        - Player A's first throw is [3, 1, 5, 4, 3].
        - Their score is 150 and their non-scoring dice are [3, 4, 3].
        - They take a chance to add to their score and throw again.
        - Their second throw results in [1, 4, 4] and their score
          rises to 250. 
        - They decide to throw a third time and get [2, 6]. 
        - Because this throw contained no scoring dice, their overall 
          score gets dropped to 0. 
        
        A player that gets all scoring dice on their first throw has 
        'hot dice' and can throw one more time without their score 
        coming into jeopardy. 
        
        At the end of each round, the player with the most points wins
        the round. At the end of the rounds, the player who won the most 
        rounds wins the game.
        "
    end
    
    def won
       puts ".     . .____   ___     . ."
       puts " \\   /  |      /   \\    | |"
       puts "  \\ /   |____  |___     | |"
       puts "   |    |          \\    | |"
       puts "   |    |____   ___/    O O"
       puts " "
       puts "Thanks for playing, #{$user_player} :)" 
       puts " "
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
       if $user_outcome == "won"
           won
       else
           lost
       end
    end
end

class GamePlay < GreedGame
    $user_outcome = ""
    
    def initialize
        @game
    end
     
    def greedy(player, set)
        
                
    end
    
    def can_roll_again(set)
        triplet = set.select{|x| set.count(x) > 2}
        triplet_indexes = []
        set.each_with_index do |num, i|
            triplet_indexes << i if triplet.include?(num)
        end
        while triplet_indexes.length > 3 
            triplet_indexes.delete(triplet_indexes.last)
        end
        triplet_indexes.each do |index|
            set[index] = nil
        end
        set = set.compact
        set = set.reject{|num| num == 1 || num == 5}
        set.empty? ? nil : set
    end
    
    def round(player)
        player_set = DiceSet.new
        times_rolled = 0
        player_roll = player_set.roll(5)
        puts "#{player} rolls #{player_roll.join(", ")}"
        player_score = player_set.score
        puts "#{player}'s score is #{player_score}"
            if can_roll_again(player_roll) == nil && times_rolled == 0
             puts "#{player} rolled hot dice! #{player.capitalize} can roll again!"
             greedy(player, player_roll)
             times_rolled += 1
            elsif 
                while times_rolled < $chances_total
                    if can_roll_again(player_roll).length == player_roll.length
                        player_score = 0
                        puts ""
                        break
                    end
                end
            end
            
        [player, player_score]
    end
    
    def winner(round)
       best_score = round.sort_by{|set| set[1]}
       best_score = best_score.select{|set| set[1] == best_score.last[1]}
       winners = best_score.flatten.select{|entry| entry.is_a?(String)}
       best_score = best_score.flatten.reject{|item| item.is_a?(String)}[0]
       if winners.length == 1
           [winners[0], best_score]
       else 
           [winners, best_score]
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
            if @@round_winners.last.flatten.length == 2
                puts "#{@@round_winners.last[0]} wins the round, with #{@@round_winners.last[1]} points!"
                puts " "
            else
                tied_score = @@round_winners.last[1]
                winners = @@round_winners.last[0]
                puts "#{winners.join(", ")} tie for the round at #{tied_score} points!"
                puts " "
            end
        end
    end
    
    def scoring
       total = @@round_winners.flatten.reject{|item| item.is_a?(Fixnum)}
       total = total.sort_by{|name| total.count(name)}
       total = total.select{|name| total.count(name) == total.count(total.last)}.uniq
       if total.length == 1
           puts "#{total.join} wins!!!"
           total.include?($user_player) ? $user_outcome = "won" : $user_outcome = "lost"
       elsif total.length == 2
           puts "#{total.join(" and ")} tie!!!"
           total.include?($user_player) ? $user_outcome = "won" : $user_outcome = "lost"
       else
           puts "#{total.join(", ")} all tie!!!"
           total.include?($user_player) ? $user_outcome = "won" : $user_outcome = "lost"
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
       puts " "
       puts "From 1 to 3 chances, how many chances should players get to get their scores?"
       $chances_total = gets.chomp.to_i
   end
end

class DiceSet < GamePlay
  def initialize
    @dice
  end
  
  def roll(num)
    returning = []
    num.times{returning << rand(1..6)}
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