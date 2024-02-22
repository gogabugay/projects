def stock_picker(prices)
  max_dif = 0
  buy = 0
  sell = 0
  prices.each_with_index do |price, index|
    prices.each_with_index do |compare, compix|
      dif = compare - price
      max_dif, buy, sell = dif, index, compix if dif > max_dif && compix > index
    end
  end
  puts "Your profit is #{max_dif}"
  [buy, sell]
end

random_numbers = Array.new(10) { rand(1..100) }

p random_numbers
p stock_picker([17,3,6,9,15,8,6,1,10])
