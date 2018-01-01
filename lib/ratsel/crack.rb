module Ratsel
  class Crack
    include SendMessage
    attr_reader :encrypted_txt, :cracked_txt, :encryption_date, :encryption_key

    def initialize(encrypted_txt, cracked_txt, encryption_date)
      @encryption_key = nil
      @encryption_date = encryption_date
      @encrypted_txt = encrypted_txt
      @cracked_txt = cracked_txt
    end

    def crack
      last_char = '..end..'
      encrypted_message = Ratsel::Accessor.read_file_text(encrypted_txt)

      encrypted_message_last_4 = encrypted_message.last(4)
      last_4_char = last_char.split("").last(4)
      encrypted_message_last_4.rotate!(4 - (encrypted_message.size % 4))
      last_4_char.rotate!(4 - (encrypted_message.size % 4))
      offsets = Ratsel::Helpers.offsets_array(@encryption_date)

      differences = Ratsel::Helpers.get_differences(
        encrypted_message_last_4,
        last_4_char,
        offsets
        )

      # Get the missing key
      key = Ratsel::Helpers.get_key(differences)

      # Initialize Decrypt method with the missing key
      Ratsel::Decrypt.new(encrypted_txt, cracked_txt, key, encryption_date).decrypt
    end
  end
end