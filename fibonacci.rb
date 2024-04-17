def fibs(number)
  i = 0
  a = 0
  b = 1
  arr = [0,1]
  while arr.length < number
    a = arr[i] + arr[i+1]
    arr << a
    i +=1
  end
  return arr
end

p fibs(20)


def fibs_rec(number)
  arr = [0,1]
  if number == 0
    arr = [0]
  elsif number == 1
    arr = [0,1]
  else
    arr = fibs_rec(number-1)
    arr << arr[-2] + arr [-1]
  end

end

p fibs_rec(19)
