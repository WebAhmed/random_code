# converting the underscores in the title to spaces and capitalizing each word
def humanize_text(text)
  new_text = text.downcase # downcase letters
  .gsub("_", " ") # substitute underscores with spaces
  .split(" ") # split at each word
  .map(&:capitalize) # capitalize each word
  .join(" ") # join the string back into a scentece
end

# Example use
# p humanize_text("This_is_some_un_humanizeD_text")

def scan_sublime_file_for_snippet_data(file)
  # read current file with nokogiri
  @file = Nokogiri::XML File.open(file)
  # parse data
  xml_data = {
    # grab snippet's content
    content: @file.css("content").text,
    # grab snippet's trigger
    trigger: @file.css("tabTrigger").text,
    # grab snippet's description
    description: humanize_text(@file.css("description").text)
  }
  # close file and return data
  @file.close
  return "N/A" unless !xml_data.nil?
end
