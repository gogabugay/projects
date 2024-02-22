def caesar_cipher(str, code)
  if code > 25
    code = code % 26
  end
  dictionary = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  arr = str.split("")
  new_frase = ""
  arr.each do |letter|
    if !dictionary.include? letter.downcase
      new_frase << letter
    elsif letter.upcase == letter
      new_index = (dictionary.index letter.downcase).to_i + code
      if new_index > 25
        new_index = new_index - 26
      end
      new_frase << dictionary[new_index].upcase
    else
      new_index = (dictionary.index letter).to_i + code
      if new_index > 25
        new_index = new_index - 26
      end
      new_frase << dictionary[new_index]
    end
  end
  new_frase

end

p caesar_cipher("Welcome, eblan", 1138)

dictionary = ["a", "b", "c" ,"d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
