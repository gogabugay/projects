def bubbl_sort(numbers)
  loop do
    swapped = false

    (numbers.length - 1).times do |i|

      if numbers[i] > numbers[i + 1]
        numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
        swapped = true
      end

    end
    break if not swapped
  end
  numbers
end

p bubbl_sort([4,3,78,2,0,2])
