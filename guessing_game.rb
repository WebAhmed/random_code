number = 1 + rand(10)
won = false

puts "#" * 50
puts " " * 10 + " WELCOME TO THE GUESSING GAME"
puts "#" * 50
print "Please guess a number between 1 and 5: "

5.times do
  guess = gets.chomp.to_i
  if guess == number
    won = true
    break
  else
    puts "Sorry try again!"
  end
end

if won
  puts "Good guess! you win"
else
  puts "Sorry the number was #{number}"
end