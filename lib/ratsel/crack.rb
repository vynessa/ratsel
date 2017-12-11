require_relative "helpers/accessor"
require_relative "helpers/cipher"
require_relative "helpers/helpers"
require_relative "helpers/message"
require_relative "decrypt"

module Ratsel
  class Crack
    include SendMessage
    attr_reader :decrypted_txt, :cracked_txt, :encryption_date, :encryption_key

    def initialize(decrypted_txt, cracked_txt, encryption_date)
      @encryption_key = nil
      @encryption_date = encryption_date
      @decrypted_txt = decrypted_txt
      @cracked_txt = cracked_txt
      @character_map = Cipher.character_map
    end

    def crack
      end_char = '..end..'
      decrypted_message = Accessor.read_file_text(decrypted_txt)

      decrypted_message_4 = decrypted_message.last(4)
      decrypted_message_4.rotate!(4 - (decrypted_message.size % 4))
      end_char_4 = end_char.split("").last(4)
      end_char_4.rotate!(4 - (decrypted_message.size % 4))
      offsets = Helpers.offsets_array(@encryption_date).join('')

      differences = get_differences(
        decrypted_message_4,
        decrypted_message_4,
        offsets
      )

      key = Helpers.get_key(differences)
      puts key
      Decrypt.new(decrypted_txt, cracked_txt, key, encryption_date).decrypt
    end

    def get_differences(decrypted_message, end_char, offsets)
      differences = []

      4.times do |i|
        diff = (@character_map.index(decrypted_message[i]) -
        @character_map.index(end_char[i]))

        diff -= offsets[i].to_i
        differences[i] = diff.to_s.rjust(2, '0')
      end

      differences
    end
  end
end