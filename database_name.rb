class DatabaseName
  def initialize(token)
  puts "In DatabaseName class"
    if /^`[a-zA-Z]*`$/.match(token)
      puts "valid Database name : #{token}"
    else
      puts "Error, not valid Database name : #{token}"
    end
  end
  # To change this template use File | Settings | File Templates.
end