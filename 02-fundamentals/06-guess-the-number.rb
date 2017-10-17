# Guess the number assignment:

=begin
Create a number guessing method which gives the following output:
    The user guessed correctly, return "You got it!"
    The guess was too high, return "Guess was too high!"
    The guess was too low, return "Guess was too low!"
=end

def guess_number user_guess
    number = 25
    puts "You got it!" unless user_guess != number
    puts "Guess was too high!" unless user_guess <= number
    puts "Guess was too low!" unless user_guess >= number
end

guess_number 24
# >> Guess was too low!
guess_number 108
# >> Guess was too high!
guess_number 25
# >> You got it!
