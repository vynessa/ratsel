require_relative "helpers"

class Encrypt
  # Cipher array
  def character_map 
    ['a', 'b', 'c', 'd', 'e',
    'f', 'g', 'h', 'i', 'j', 'k',
    'l', 'm', 'n', 'o', 'p', 'q',
    'r', 's', 't', 'u', 'v', 'w',
    'x', 'y', 'z', 1, 2, 3, 4, 5,
    6, 7, 8, 9, ' ', '.', ',']
  end

  def encrypt
    encrypted_message = []  
    @character_map = character_map
    @sum_rotation_offset = Helpers.sum_rotation_offset
    message_array = Helpers.read_file_text('/test.txt').downcase.split('')
    n = message_array.length
  
    n.times { 
      char_rotate = @character_map.rotate(@character_map.index(message_array.shift))
      rotated_array = char_rotate.rotate(@sum_rotation_offset.shift)
      encrypted_message << rotated_array.shift
    }
  
    encrypted_message.join
  end
end