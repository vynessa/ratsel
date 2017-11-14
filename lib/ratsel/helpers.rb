class Helpers
  # Read text from file
  def self.read_file_text(text_file)
    message = File.open(File.dirname(__FILE__) + text_file).each { |line| return line }
  end

  # Get date in DDMMYY format
  def self.get_date_time
    date = Time.new
    date = date.day.to_s + date.month.to_s  + (date.year % 100).to_s
  end  
  
  # Get offsets array from the date of message transmission
  def self.offsets_array
    offsets_array = []
    date_square = get_date_time.to_i ** 2
    new_str = date_square.to_s.reverse
    new_str = new_str.slice!(0..3).reverse.split('')

    new_str.each { |str| offsets_array << str.to_i }

    offsets_array
  end

  # Generate a random 5 digits key  
  def self.rotation_array
    key_rotor_array = []   
    key = (0...5).map { (1..9).to_a[rand(9)] }.join
    key_array = key.split('')
    n = key_array.length - 1 
      
    n.times { key_rotor_array << (key_array.shift + key_array[0]).to_i }

    key_rotor_array
  end

  # Sum of A - n rotation and A - n offsets
  def self.sum_rotation_offset
    sum_array = []
    @offsets_array = offsets_array
    @rotation_array = rotation_array
    n = @offsets_array.length || @rotation_array.length

    n.times { sum_array << @offsets_array.shift + @rotation_array.shift }

    sum_array
  end
end

