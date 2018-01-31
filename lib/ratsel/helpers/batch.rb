module Ratsel
  class Batch
    def self.get_batch(message_array, sum_rotation_offset)
      new_message = ''
      sliced_string_array = []
      @character_map = Ratsel::Cipher.character_map

      message_array.each_slice(4) { |message|
        sliced_string_array << message.join('')
      }

      sliced_string_array.each_with_index { |batch, index|
        message_batch = batch.downcase.split('')
        n = message_batch.length
    
        n.times { |i|
          char_rotate = @character_map.rotate(@character_map.index(message_batch.shift))
          rotated_array = char_rotate.rotate(sum_rotation_offset[i])
          new_message << rotated_array.shift
        }
      }

      new_message
    end
  end
end