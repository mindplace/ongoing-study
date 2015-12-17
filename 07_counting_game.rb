# A Bigger Challenge: The Counting Game
#
# Let's take on a more challenging logic problem. Remember the counting game
# that you pseudocoded during the Pseudocoding Assignment? For a recap:
#
# 10 friends are sitting in a circle around a table and decide to play a new 
# game. In it, they count up through the numbers from 1 to 100. The first person 
# says "1", the second says "2" and so on... but with a few catches:
#
# Whenever the number is divisible by 7, they switch directions. So person 6 
# will say "6", person 7 will say "7", then person 6 again will say "8".
# Whenever the number is divisible by 11, they skip the next person for the 
# following number. For instance, if person 3 says "33", person 5 will say 
# "34" instead (person 4 gets skipped).
# Your job is to code a program which outputs each number and which person 
# said it. Use it to show that player 1 will say the number "100".
# Tips:
# Remember to stick with brute force instead of trying to "figure out" 
# the trick to the problem.
# Name your variables well!
# Ignore the skipping to start out with. Only add it when you're ready.
# Advanced Option:
# Make your method take two inputs -- the number of players and the number 
# you're counting up to. Then see who says the last number each time!


def counting_game(players, max)
    player_array = (1..players).to_a
    
    direction = 1
    i = 1
    player_index = 0
    while i < max
    
        # players index gets circled
        player_index = 0 if (player_index == players + 1)
        (player_index = players - 1) if player_index == -1
        
        puts "player #{player_array[player_index]} says #{i}"
        
        if (i % 7 == 0) && (i % 11 == 0)
            direction *= -1
            player_index += 1 * direction
        elsif i % 11 == 0
            player_index += 2
        elsif i % 7 == 0
            direction *= -1
            player_index += 1 * direction
        else
            player_index += 1 * direction
        end

        i += 1
    end
end

puts counting_game(10, 100)