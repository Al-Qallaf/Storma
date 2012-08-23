class Delete_Update
  $number_of_passes = 0

  def initialize()
    puts "In Delete_Update Class"
  end

  def validate(token)
    case token
      when "DELETE"
        return_value = true

      when "UPDATE"
        return_value = true

      else
        puts "Error, In Delete_Update Class"
        $number_of_passes = 0
        return_value = token
    end

    return return_value
  end
  def pass_times_increase()
    $number_of_passes = $number_of_passes + 1
  end

  def pass_times()
    return $number_of_passes
  end

end