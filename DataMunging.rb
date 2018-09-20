class String
  def numeric? #Method for know if a string is numeric
    Float(self) != nil rescue false
  end
end

class File_Processor
  def convert_table_to_array(path) #Method for read a file with a table and return and array with the information
    file_input = File.open(path, File::RDONLY){|f| f.read }
    file_input.lines
  end

  def minimum_difference_two_columns(data_array, element_name_position, column1_position, column2_position) #Method for find the element with the lowest difference between two defined columns
    minimum_difference = 0
    element_name = ''
    data_array.each do |element|
      if element.split[column1_position].to_s.numeric?
        if element_name == ''
          minimum_difference = (element.split[column1_position].to_i) - (element.split[column2_position].to_i)
          element_name = element.split[element_name_position].to_s
        else
          difference = (element.split[column1_position].to_i) - (element.split[column2_position].to_i)
          if difference < minimum_difference
            minimum_difference = difference
            element_name = element.split[element_name_position].to_s
          end
        end
      end
    end
    puts "El elemento #{element_name} tiene la menor diferencia entre las dos columnas (#{minimum_difference})"
  end

end

puts 'Weather Table'
obj = File_Processor.new
array = obj.convert_table_to_array('./weather.dat')
obj.minimum_difference_two_columns(array,0,1,2)

puts 'Football Table'
obj = File_Processor.new
array = obj.convert_table_to_array('./football.dat')
obj.minimum_difference_two_columns(array,1,6,8)
