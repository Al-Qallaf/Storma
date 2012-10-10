class Readio
  def readthefile(filename)
    lines = ""
    File.open("#{filename}", 'r') do |f1|
      while line = f1.gets
        lines = lines + line
      end
      array_tokens = lines.split
      puts array_tokens.length
      return array_tokens
    end
  end

	#def readthefile()
	#	lines = ""
	#	File.open('../default.sql', 'r') do |f1|
	#		while line = f1.gets
	#			lines = lines + line
	#		end
	#		array_tokens = lines.split
	#		puts array_tokens.length
	#		return array_tokens
	#	end
	#end
end