require 'time'

#getting a dictionary

dict = File.readlines('google-10000-english-no-swears.txt')

#selecting a random word
word = dict.sample.chomp

#checking if word length is legit and getting a new one if it's not
while word.length < 5 || word.length > 12
  word = dict.sample.chomp
end

class NewGame
  attr_accessor :word, :board, :wrong_letters, :guessed_letters, :word_arr
  def initialize(word)
    @word = word
    @word_arr = []
    @wrong_letters=[]
    @guessed_letters = []
    @board = Array.new(@word.length, "_")
  end
  #setting an array from the word
  def split_word
    @word_arr = @word.split("")
  end

  #method to get player's input
  def player_turn
    puts "Guess the letter"
    guess = gets.chomp
    unless guess.length == 1
      if guess == "save"
        save_game
        puts "The game was saved"
      elsif guess == "load"
        load_game
      else
        puts "Try again"
      end
      guess = gets.chomp
    end
    guess
  end


  #method to check if player's letter is in the word
  def guess_in_word(guess)
    unless @guessed_letters.include?(guess)
      @guessed_letters << guess
    end
    if @word.include?(guess)
      puts "The letter is correct!"
      unless @wrong_letters.empty?
        "Here are wrong letters: #{wrong_letters}"
      end
    else
      puts "Sorry, wrong letter"
      unless @wrong_letters.include?(guess)
        @wrong_letters << guess
      end
      puts "Here are wrong letters: #{@wrong_letters}"
    end
    puts "Here are the letters that you have guessed: #{@guessed_letters}"
  end

  #showing the start board
  def show_board
    puts "Here is your word:"
    show_board = @word.length.times {print "_ "}
  end



  #searching for the player's letter in a word and placing in on the board
  def find_and_place_letter(guess)
    @word_arr.each_with_index do |letter, index|
      if letter == guess
        @board[index] = guess
      end
    end
    @board
  end

  def save_game
    filename = "saved_game_#{Time.now.strftime("%Y-%m-%d %H-%M")}"
    File.open(filename, 'w') do |file|
      file.puts "word #{@word}"
      file.puts "board #{@board.join("")}"
      file.puts "wrongs #{@wrong_letters.join("")}"
      file.puts "guessed #{@guessed_letters.join("")}"
    end
  end

  def load_game
    puts "Enter your saved game file name"
    filename = gets.chomp
    lines = File.readlines(filename, chomp: true)
    lines.each_with_index do |line, index|
      if line.split.first == "word"
        @word = line.split.last
        @word_arr = @word.split("")
      elsif line.split.first == "board"
        @board = line.split.last.split("")
      elsif line.split.first == "wrongs"
        @wrong_letters = line.split.last.split("")
      elsif line.split.first == "guessed"
        @guessed_letters = line.split.last.split("")
      end
    end
    puts "The game was loaded"
    puts "Your board is"
    puts @board.join(" ")
    puts "The wrong letters: #{@wrong_letters}"
    puts "The guessed letter: #{@guessed_letters}"
  end
end

  # p guess_in_word("a", word_arr, wrong_letters, right_letters)

  # player_turn

game = NewGame.new(word)
game.show_board
game.word_arr = game.split_word
puts "\nIf you want to load game, enter 'load'"


while game.board.count("_") > 0


  guess = game.player_turn

  puts game.guess_in_word(guess)

  game.find_and_place_letter(guess)
  puts game.board.join(" ")
  # game.save_game

  # loaded_game = load_game
  # p loaded_game
end


puts "Coungrutalations! Your word is #{game.word}"
