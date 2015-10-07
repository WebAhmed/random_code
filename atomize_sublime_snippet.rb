target_files = Dir.glob("*.sublime-snippet")
Dir.mkdir("atom_snippets") unless File.directory?("atom_snippets")

target_files.each do |target_file|

  lines = File.read target_file

  snippet = lines.scan(/\<\!\[CDATA\[(.*)\]\]\>/)
  trigger = lines.scan(/\<tabTrigger\>(.*)\<\/tabTrigger\>/)
  description = lines.scan(/\<description\>(.*)\<\/description\>/)

  new_file = File.new("atom_snippets/#{target_file.sub("sublime-snippet", "cson")}","w")

  File.open( new_file,"w") do |f|
    if (snippet.empty? || trigger.empty? || description.empty?)
      File.delete f
    else
      f.write "'.text.html.erb':\n\t'#{description.last.first}':\n\t\t'prefix': '#{trigger.last.first}'\n\t\t'body': '#{snippet.last.first}'"
    end
  end
  new_file.close
end
