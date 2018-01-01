require_relative "helpers/accessor"
require_relative "helpers/cipher"
require_relative "helpers/helpers"
require_relative "helpers/message"
require 'json'

module Ratsel
  class Decrypt
    include SendMessage
    attr_reader :encryption_key, :encrypted_txt, :decrypt_txt, :character_map,
                :sum_rotation_offset, :encryption_date
                
    def initialize(encrypted_txt, decrypt_txt, encryption_key, encryption_date)
      @encryption_key = encryption_key
      @encrypted_txt = encrypted_txt
      @decrypt_txt = decrypt_txt
      @character_map = Cipher.character_map
      @encryption_date = encryption_date
      @offsets_array = Helpers.offsets_array(@encryption_date)
      @rotation_array = Helpers.rotation_array(@encryption_key)
      @sum_rotation_offset = Helpers.sum_rotation_offset(@offsets_array, @rotation_array)
    end

    def decrypt
      decrypted_message = ''
      sliced_encrypted_array = []
      sum_rotation_offset = @sum_rotation_offset.map { |n| -n.abs }
      @encrypted_message = Accessor.read_file_text(@encrypted_txt)
    
      @encrypted_message.each_slice(4) { |message|
        sliced_encrypted_array << message.join('')
      }
    
      sliced_encrypted_array.each_with_index { |batch, index|
        encrypted_batch = batch.downcase.split('')
        
        n = encrypted_batch.length
    
        n.times { |i|
          char_rotate = @character_map.rotate(@character_map.index(encrypted_batch.shift))
          rotated_array = char_rotate.rotate(sum_rotation_offset[i])
          decrypted_message << rotated_array.shift
        }
      }

      message(decrypt_txt, encryption_key, encryption_date)

      Accessor.write_encrypted_texts(decrypt_txt, decrypted_message)
        
      decrypted_message
    end
  end
end