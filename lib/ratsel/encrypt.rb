require_relative "helpers/accessor"
require_relative "helpers/cipher"
require_relative "helpers/helpers"
require_relative "helpers/message"

module Ratsel
  class Encrypt
    include SendMessage
    attr_reader :message_txt, :encrypted_txt, :encryption_date, :character_map, :encryption_key, 
                :offsets_array, :rotation_array, :sum_rotation_offset

    def initialize(message_txt, encrypted_txt)
      @message_txt = message_txt
      @encrypted_txt = encrypted_txt
      @encryption_date = Time.now.strftime("%d%m%y")
      @character_map = Cipher.character_map
      @encryption_key = (1..5).map { (1..9).to_a[rand(9)] }.join
      @offsets_array = Helpers.offsets_array(@encryption_date)
      @rotation_array = Helpers.rotation_array(@encryption_key)
      @sum_rotation_offset = Helpers.sum_rotation_offset(@offsets_array, @rotation_array)
    end

    def encrypt
      message = Accessor.read_file_text(@message_txt)
      encrypted_message = ''
      sliced_message_array = []

      message.each_slice(4) { |message|
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

      message(message_txt, encryption_key, encryption_date)
        
      encrypted_message
    end
  end
end