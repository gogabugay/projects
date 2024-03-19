dict = File.readlines('google-10000-english-no-swears.txt')

word = dict.sample.chomp
unless word.length > 5 && word.length < 12
  word = dict.sample.chomp
end

def player_turn
  puts "Guess the letter"
  guess = gets.chomp
  unless guess.length == 1
    puts "Try again"
    guess = gets.chomp
  end
end

player_turn
