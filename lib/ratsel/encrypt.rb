require_relative "helpers"

class Encrypt
  def encrypt(message_txt, encrypted_txt)
    encrypted_message = []
    sliced_message_array = []
    @character_map = Helpers.character_map  
    @message = Helpers.read_file_text(message_txt).split('')

    @message.each_slice(4) { |message|
      sliced_message_array << message.join('')
    }

    sliced_message_array.each_with_index { |batch, index|
      @sum_rotation_offset = Helpers.sum_rotation_offset(encrypted_txt)
      message_array = batch.downcase.split('')
      
      n = message_array.length
  
      n.times { 
        char_rotate = @character_map.rotate(@character_map.index(message_array.shift))
        rotated_array = char_rotate.rotate(@sum_rotation_offset.shift)
        encrypted_message << rotated_array.shift
      }
    }
      
    encrypted_message = encrypted_message.join

    File.open(encrypted_txt, "a") do |line|
      line.write("\n#{encrypted_message}")   
    end
  end
end