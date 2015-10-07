require 'humanize'

def inquire
  response = gets.chomp.downcase
  if response == "yes"
    puts "Challenge accepted!"
    play
  elsif response == "no"
    puts "Ok see you later!"
  else
    print "huh? Please try yes or no "
    inquire
  end
end


def play
  print "What's the base integer? "
  base = gets.chomp.to_i
  base_in_words = base.humanize

  print "What's the power? "
  power = gets.chomp.to_i
  power_in_words = power.humanize

  result = base ** power
  result_in_words = result.humanize

  print "Let me think"

  10.times { sleep(0.08); print "." }

  puts "\nThe number #{base_in_words} raised to the power of #{power_in_words} equals #{result_in_words}!"
  print "Try another time? "
  inquire
end




puts "Hey there!\nI can raise any integer to the power of any another integer and give you back the answer in words!"

print "Would you like challenge me? "

inquire
