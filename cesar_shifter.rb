################################################################################
# PSEDUCODE
################################################################################
# INPUT:
################################################################################
# - A normal string
# - A coding key (integer)
################################################################################
# OUTPUT:
################################################################################
# - A coded string based on the key.
################################################################################
# STEPS:
################################################################################
# - split the string into chars.
# - loop through the string.
#   + if the current char is a letter
#     # convert the letter to a number
#     # add the factor to the number
#     # convert the new number to a letter
#   + else
#     - skip to next letter
# - Join the string again.


################################################################################
# Tests:
################################################################################

def assert truthy
  raise "Tests failed" unless truthy
end

def encode_char(char, offset)
  if char =~ /[a-zA-Z]/
    #check the letter's range
    check_range(char)
    # convert the letter to a number
    letter_val = char.ord
    # add the factor to the number
    new_letter_val = letter_val + offset
    # convert the new number to a letter
    new_letter_val.chr
  else
    char
  end
end

def check_range(char)
  if 
end

def encode_str(str, offset)
  # split the string into letters
  chars = str.chars
  # loop through the letters and convert each
  new_chars = []
  chars.map do |letter|
    new_chars << encode_char(letter, offset)
  end
  # Join the string again.
  new_chars.join('')
end


assert(encode_char("a", 3) == "d")
assert(encode_str("a",1) == "b")
assert(encode_str("b",3) == "e")
assert(encode_str("d",5) == "i")
assert(encode_str("A",2) == "C")
assert(encode_str("M",3) == "P")
assert(encode_str("#",5) == "#")
assert(encode_str("%",10) == "%")

assert(encode_str("abCd'E fG %",3) == "deFg'H iJ %")

puts " Tests are passing - party!"
