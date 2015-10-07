###################################################################
# PSUEDOCODE
###################################################################
# Creating Rails snippets for Atom using Rails Sublime Snippets
#
###################################################################
# INPUTS
###################################################################
# - A directory of sublime snippet files
#
###################################################################
# OUTPUTS
###################################################################
# - A directory of files CSON files to be used as snippets
#
###################################################################
# STEPS
###################################################################
=begin

 - loop though the files
  - open directory
  - loop through entries
 - substitue the extention from "sublime-snippet" to "cson"
 - edit content
  - open file
  - search for pattern
  - extract the patterns
  - empty file
  - paste code
  - save file


=end

# def convert_from_sublime_to_cson(array)
#   array.each do |entry|
#     entry.gsub!(/(.sublime-snippet)/, ".cson")
#   end
# end

# def extract_snippet_code(file)

#   current_file = File.open(file,"a")
#   snippet = current_file.scan(\<\!\[CDATA\[(.*)\]\]\>)
#   trigger = current_file.scan(\<tabTrigger\>(.*)\<\/tabTrigger\>)
#   description = current_file.scan(\<description\>(.*)\<\/)description\>

#   current_file.write "'.text.html.erb':\n\t'#{description}':\n\t\t'prefix': '#{trigger}'\n\t\t'body': '#{snippet}'"
# end



# puts "Enter extraction path:"
# path = gets.chomp! # Prompt for path
# directory = Dir.open(path) # The path for the directory
# entries = directory.entries # An array of the directory files

# convert_to_cson(entries)




# p path
# p directory
# p entries

dir = Dir.open "."

current_file = File.open(file,"a")
current_file.write "'.text.html.erb':\n\t'#{description}':\n\t\t'prefix': '#{trigger}'\n\t\t'body': '#{snippet}'"