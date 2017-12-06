require_relative "helpers/helpers"
require 'json'

module Ratsel
  class Ratsel::Decrypt
    def decrypt(encrypted_txt)
      decrypted_message = []
      sliced_encrypted_array = []
      @encrypted_message = Helpers.write_encrypted_texts(encrypted_txt)
      @character_map = Helpers.character_map

      # Remove newline character
      lam = lambda { |str| return str.gsub("\n", "")}
      encrypted_message = @encrypted_message.map(&lam)[3].split('')
      sum_rotation_offset = JSON.parse @encrypted_message.map(&lam)[2]
    
      encrypted_message.each_slice(4) { |message|
        sliced_encrypted_array << message.join('')
      }
    
      sliced_encrypted_array.each_with_index { |batch, index|
        encrypted_batch = batch.downcase.split('')
        
        n = encrypted_batch.length
    
        n.times { |i|
          char_rotate = @character_map.rotate(@character_map.index(encrypted_batch.shift))
          rotated_array = char_rotate.rotate(-(sum_rotation_offset[i]))
          decrypted_message << rotated_array.shift
        }
      }
        
      decrypted_message = decrypted_message.join      
    end
  end
end