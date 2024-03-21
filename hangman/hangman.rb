require 'time'

#getting a dictionary
dict = File.readlines('google-10000-english-no-swears.txt')

#selecting a random word
word = dict.sample.chomp

#checking if word length is legit and getting a new one if it's not
while word.length < 5 || word.length > 12
  word = dict.sample.chomp
end

#setting an array from the word
p word_arr = word.split("")

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
    unless wrong_letters.empty?
      "Here are wrong letters: #{wrong_letters}"
    end
  else
    puts "Sorry, wrong letter"
    wrong_letters << guess
    puts "Here are wrong letters: #{wrong_letters}"
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
def find_and_place_letter(guess, word_arr, board)
  word_arr.each_with_index do |letter, index|
    if letter == guess
      board[index] = guess
    end
  end
  board
end

def save_game(word, board, wrong_letters)
  filename = "saved_game_#{Time.now.strftime("%Y-%m-%d %H-%M")}"
  File.open(filename, 'w') do |file|
    file.puts word
    file.puts board.join(" ")
    file.puts {wrong_letters.join(" ")}
  end
end

def load_game
  puts "Enter your saved game file name"
  filename = gets.chomp
  lines = File.readlines(filename, 'w')
  output = []
  lines.each do |line|
    output << line.chomp

  end
  output
end

# p guess_in_word("a", word_arr, wrong_letters, right_letters)

# player_turn


show_board(word)
board = init_board(word)
# while board.count("_") > 0


  guess = player_turn

  puts guess_in_word(guess, word, wrong_letters, right_letters)

  board = find_and_place_letter(guess, word_arr, board)
  puts board.join(" ")

  save_game(word, board, wrong_letters)
  loaded_game = load_game
  p loaded_game
# end


puts "Coungrutalations! Your word is #{word}"
