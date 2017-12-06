module Ratsel
  class Ratsel::Helpers
    # Encryted info
    def self.write_encrypted_texts(text_file)
      encrypted_object = []
      File.open(File.dirname(__FILE__) + text_file).each { |line|
        encrypted_object << line
      }

      encrypted_object
    end

    # Get date in DDMMYY format
    def self.get_date(encrypt_txt)
      date = Time.new
      date = date.day.to_s + date.month.to_s  + (date.year % 100).to_s

      File.open(encrypt_txt, "w") do |f|     
        f.write("#{date}")   
      end

      date
    end  

    # Generate a random 5 digits key
    def self.generated_key(encrypt_txt)
      key = (0...5).map { (1..9).to_a[rand(9)] }.join

      File.open(encrypt_txt, "a") do |f|     
        f.write("\n#{key}")   
      end

      key
    end

    # Get offsets array from the date of message transmission
    def self.offsets_array(encrypt_txt)
      offsets_array = []
      date_square = get_date(encrypt_txt).to_i ** 2
      new_str = date_square.to_s.reverse
      new_str = new_str.slice!(0..3).reverse.split('')

      new_str.each { |str| offsets_array << str.to_i }

      offsets_array
    end

    # Get offsets from generated key
    def self.rotation_array(encrypt_txt)
      key_rotor_array = [] 
      key_array = generated_key(encrypt_txt).split('')
        
      4.times { key_rotor_array << (key_array.shift + key_array[0]).to_i }

      key_rotor_array
    end

    # Sum of A - n rotation and A - n offsets
    def self.sum_rotation_offset(encrypt_txt)
      sum_array = []
      @offsets_array = offsets_array(encrypt_txt)
      @rotation_array = rotation_array(encrypt_txt)

      4.times { sum_array << @offsets_array.shift + @rotation_array.shift }

      File.open(encrypt_txt, "a") do |f|     
        f.write("\n#{sum_array}")   
      end

      sum_array
    end

    # Read text from file
    def self.read_file_text(text_file)
      message = ''
      File.open(File.dirname(__FILE__) + text_file, 'rb').each { |line| message += line }
      new_message = message.downcase
    end

    def self.character_map 
      ['a', 'b', 'c', 'd', 'e',
      'f', 'g', 'h', 'i', 'j', 'k',
      'l', 'm', 'n', 'o', 'p', 'q',
      'r', 's', 't', 'u', 'v', 'w',
      'x', 'y', 'z', '1', '2', '3', '4', '5',
      '6', '7', '8', '9', ' ', '.', ',']
    end
  end
end

