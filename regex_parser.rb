# create a new directory to store new files in
dir = Dir.mkdir("snippets") unless File.directory?("snippets")

# collect files to work on ( array of sublime snippets)
target_files = Dir.glob("*.sublime-snippet")

# iterate over the files
target_files.each do |target_file|

  # open each file for reading
  file = File.open target_file, "r"
  # read file lines and delete white spaces
  lines = File.read(file).delete(" ")
  # grab the snippet
  snippet = lines.scan(/\<\!\[CDATA\[(.*)\]\]\>/)
  # grab the trigger
  trigger = lines.scan(/\<tabTrigger\>(.*)\<\/tabTrigger\>/)
  # grab the description
  description = lines.scan(/\<description\>(.*)\<\/description\>/)
  # if regex return nil delete the file
  # else write snippet to file
  # close file
  if (snippet.empty? || trigger.empty? || description.empty?)
    File.delete(file.path)
  else
    # create a new file from original file in atom_snippets directory
    # replace .sublime-snippet with .cson
    new_file = File.new("snippets/#{target_file.sub("sublime-snippet", "cson")}","w")
    new_file.write <<-doc
'.text.html.erb':
  '#{description.first.last}':
    'prefix': '#{trigger.first.last}'
    'body': \"\"\"
    #{snippet.first.last}
    \"\"\"
    doc
  end
  new_file.close
end
