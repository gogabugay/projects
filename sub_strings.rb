def substrings(string, dictionary)
  # str_arr = string.tr(".,!?", "").downcase.split(" ")
  lower_case_str = string.downcase
  hashbrown = Hash.new
  dictionary.each do |word|
    hashbrown[word] = lower_case_str.scan(word).length unless lower_case_str.scan(word).length == 0
  end
  hashbrown
end

dic = ["below", "below", "down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dic)

p substrings("Howdy partner, sit down! How's it going?", dic)

p "Howdy partner, sit down! How's it going?".downcase.scan("how")
