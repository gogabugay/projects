#getting a dictionary
dict = File.readlines('google-10000-english-no-swears.txt')

#selecting a random word
word = dict.sample.chomp

#checking if word length is legit and getting a new one if it's not
while word.length < 5 || word.length > 12
  word = dict.sample.chomp
end

#setting an array from the word
word_arr = word.split("")

#method to get player's input
def player_turn
  puts "Guess the letter"
  guess = gets.chomp
  unless guess.length == 1
    puts "Try again"
    guess = gets.chomp
  end
  guess
end

#not sure if these are neccessary but currently they store right and wrong letters
wrong_letters = []
right_letters = []

#method to check if player's letter is in the word
def guess_in_word(guess, word, wrong_letters, right_letters)
  if word.include?(guess)
    puts "The letter is correct!"
  else
    puts "Sorry, wrong letter"
    wrong_letters << guess
  end
end

#showing the start board
def show_board(word)
  puts "Here is your word:"
  show_board = word.length.times {print "_ "}
end

#actually creating a start board
def init_board(word)
  board = Array.new(word.length, "_")
end

#searching for the player's letter in a word and placing in on the board
def find_and_place_letter(guess, word, board)
  letter_index = word.find_index(guess)
  board[letter_index] = guess
  board
end


# p guess_in_word("a", word_arr, wrong_letters, right_letters)

# player_turn


show_board(word)
board = init_board(word)

guess = player_turn

puts guess_in_word(guess, word, wrong_letters, right_letters)

board = find_and_place_letter(guess, word_arr, board)
puts board.join(" ")
