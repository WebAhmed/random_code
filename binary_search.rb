def find_num(array,target)
  min = 0
  max = array.count - 1
  while true
    guess = ((min + max)/2).floor
    if guess == target
      return "The number is #{array[target]}"
    elseif guess < target
      


  