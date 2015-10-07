require 'nokogiri'
require 'pry'

# converting the underscores in the title to spaces and capitalizing each word
# Example use
# p humanize_text("This_is_some_un_humanizeD_text")

def humanize_text(text)
  new_text = text.downcase # downcase letters
  .gsub("_", " ") # substitute underscores with spaces
  .split(" ") # split at each word
  .map(&:capitalize) # capitalize each word
  .join(" ") # join the string back into a scentece
end

# Returns a hash of XML data correctly formatted for atom.
def format_returned_data(file)
  return xml_data = {
    # grab snippet's content
    content: file.css("content").text,
    # grab snippet's trigger
    trigger: file.css("tabTrigger").text,
    # grab snippet's description
    description: humanize_text(file.css("description").text)
  }
end


def scan_file_for_snippet_data(file)
  # read current file with nokogiri
  open_file = File.open(file, "r")
  @file = Nokogiri::XML(open_file)
  open_file.close
  # parse data
  format_returned_data(@file)
end

# create a new directory to store the new files in.
Dir.mkdir("snippets") unless File.directory?("snippets")

# collect sublime files from current directory
@sublime_files = Dir.glob("*.sublime-snippet")

# convert sublime xml files to atom cson files
# iterate over sublime files
@sublime_files.each do |sublime_file|
  # create a new file with new extention inside snippets folder
  xml = scan_file_for_snippet_data(sublime_file)
  # skip if values are empty
  next if xml.has_value?(nil || "")
  # convert file name
  file_name = sublime_file.sub("sublime-snippet", "cson")
  # create a new file with the proper extention
  file = File.new("snippets/#{file_name}", "w")
  # write snippet data to file
  file.write <<-doc
'.text.html.erb':
  '#{xml[:description]}':
    'prefix': '#{xml[:trigger]}'
    'body': \"\"\"
    #{xml[:content]}
    \"\"\"
    doc
  # close file
  file.close
end
