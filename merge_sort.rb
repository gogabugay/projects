def merge_sort(arr)
  if arr.length < 2
    return arr

  end
  middle = arr.length/2
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..arr.length])

  sorted = []

  until left.empty? || right.empty?
    left.first <= right.first ? sorted << left.shift : sorted << right.shift
  end

  sorted + left + right

end

p merge_sort([105, 79, 100, 110])
