# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

class Players
    $players = []
    
    def initialize(name)
        @player = name
        $players << @player
    end
    
    def all_players
        $players
    end
end


class DiceSet
  def initialize
    @dice
  end
  
  def roll(num)
    returning = []
    num.times{returning << rand(1..6)}
    @dice = returning
  end
  
  def values
    @dice
  end
  
  def score
    dice = @dice
    return 0 if dice.length == 0
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