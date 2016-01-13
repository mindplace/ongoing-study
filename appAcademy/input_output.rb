# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.

def guessing_game
  computer_choice = rand(1..100)
  puts "Let's play a guessing game!"
  puts "Computer's got a number..."
  user_guess = 0
  guesses = 0
  while user_guess != computer_choice
    puts "Guess the number!"
    user_guess = gets.chomp.to_i
    puts user_guess
    guesses += 1
    if user_guess > computer_choice
      puts "Too high..."
    elsif user_guess < computer_choice
      puts "Too low..."
    elsif user_guess == computer_choice
      puts "You got it! It was #{computer_choice}!"
      puts "You got it in #{guesses} guesses!"
      puts "Thanks for playing :)"
      break
    end
  end
end

#guessing_game

# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def make_up_file_name
  puts "Computer says, \"Help me out! Make up a file name for me!\""
  name = gets.chomp
  puts "Computer says, \"Thanks!!\""
  
  file_name = "#{name}-shuffled.txt"
  
  new_file = File.new(file_name, "w")
  shuffled_name = name.split("").shuffle.join
  new_file << shuffled_name
end

#make_up_file_name
