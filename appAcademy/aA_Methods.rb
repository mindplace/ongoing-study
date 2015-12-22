# Implement a Rock, Paper, Scissors game. The method rps should take a string 
# (either "Rock", "Paper" or "Scissors") as a parameter and return the computer's 
# choice, and the outcome of the match. Example:
#    rps("Rock") # => "Paper, Lose"
#    rps("Scissors") # => "Scissors, Draw"
#    rps("Scissors") # => "Paper, Win"

def rps(your_move)
    moves = ["Rock", "Paper", "Scissors"]
    comp_move = moves[rand(moves.length)]
    
    return puts "I have #{comp_move}, we draw" if your_move == comp_move 
    return puts "I have #{comp_move}, you lose" if 
        (comp_move == "Rock" && your_move == "Scissors") ||
        (comp_move == "Paper" && your_move == "Rock") ||
        (comp_move == "Scissors" && your_move == "Paper")
    return puts "I have #{comp_move}, you win" if 
        (your_move == "Rock" && comp_move == "Scissors") ||
        (your_move == "Paper" && comp_move == "Rock") ||
        (your_move == "Scissors" && comp_move == "Paper")
end

rps("Rock")
rps("Scissors")
rps("Paper")




# Implement a Swingers game. The method swingers should take an array of couple 
# arrays and return the same type of data structure, with the couples mixed up. 
# Assume that the first item in the couple array is a man, and the second item is a woman. 
# Don't pair a person with someone of their own gender (sorry to ruin your fun). 
# An example run of the program:
#    swingers([
#  ["Clyde", "Bonnie"],
#  ["Paris", "Helen"],
#  ["Romeo", "Juliet"]
# ])

def swingers(arrays)
   returning = []
   arrays.each_with_index do |couples, i|
       man = couples[0]
       if i == arrays.length - 1
           i = 0
           woman = arrays[i][1]
       else 
           i += 1
           woman = arrays[i][1]
       end
       returning << [man, woman]
   end
   returning.each do |new_couple|
       puts "#{new_couple.join(" is now with ")}"
   end
end

 swingers([["Clyde", "Bonnie"], ["Romeo", "Juliet"], ["Paris", "Helen"], ["Thomas", "Esther"] ])

# Bonus problem: make a version of the swingers game that guarantees that all 
# the couples end up with a different partner!