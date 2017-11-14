class Helpers
  def self.character_map 
    ['a', 'b', 'c', 'd', 'e',
    'f', 'g', 'h', 'i', 'j', 'k',
    'l', 'm', 'n', 'o', 'p', 'q',
    'r', 's', 't', 'u', 'v', 'w',
    'x', 'y', 'z', 1, 2, 3, 4, 5,
    6, 7, 8, 9, ' ', '.', ',']
  end

  def self.read_file_text(text_file)
    message = File.open(File.dirname(__FILE__) + text_file).each { |line| return line }
  end

  def self.get_date_time
    date = Time.new
    date = date.day.to_s + date.month.to_s  + (date.year % 100).to_s
  end  
  
  def self.offsets
    date_square = get_date_time.to_i ** 2
    new_str = date_square.to_s.reverse
    new_str = new_str.slice!(0..3).reverse
    offset = new_str.to_i
  end

  def self.generate_key
    key = (0...5).map { (1..9).to_a[rand(9)] }.join
    
  end

  def self.rotation
    key_rotor_array = []    
    key_array = generate_key.split('')
    n = key_array.length - 1 
      
    n.times do
      key_rotor_array << (key_array.shift + key_array[0]).to_i
    end
    
    key_rotor_array
  end
end

