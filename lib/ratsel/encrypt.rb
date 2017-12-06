require_relative "helpers/helpers"

module Ratsel
  class Ratsel::Encrypt
    def encrypt(message_txt, encrypted_txt)
      @character_map = Helpers.character_map
      @sum_rotation_offset = Helpers.sum_rotation_offset(encrypted_txt)      
      @message = Helpers.read_file_text(message_txt).split('')
      encrypted_message = []
      sliced_message_array = []

      @message.each_slice(4) { |message|
        sliced_message_array << message.join('')
      }

      sliced_message_array.each_with_index { |batch, index|
        message_batch = batch.downcase.split('')
        n = message_batch.length
    
        n.times { |i|
          char_rotate = @character_map.rotate(@character_map.index(message_batch.shift))
          rotated_array = char_rotate.rotate(@sum_rotation_offset[i])
          encrypted_message << rotated_array.shift
        }
      }
        
      encrypted_message = encrypted_message.join

      File.open(encrypted_txt, "a") do |line|
        line.write("\n#{encrypted_message}")   
      end
    end
  end
end