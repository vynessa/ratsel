require_relative "helpers/accessor"
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
      @encryption_date = encryption_date
      @offsets_array = Helpers.offsets_array(@encryption_date)
      @rotation_array = Helpers.rotation_array(@encryption_key)
      @sum_rotation_offset = Helpers.sum_rotation_offset(@offsets_array, @rotation_array)
    end

    def decrypt
      @encrypted_message = Accessor.read_file_text(@encrypted_txt)
      
      @sum_rotation_offset = @sum_rotation_offset.map { |n| -n.abs }

      decrypted_message = Ratsel::Batch.get_batch(@encrypted_message, @sum_rotation_offset)

      log_message(decrypt_txt, encryption_key, encryption_date)

      Accessor.write_encrypted_texts(decrypt_txt, decrypted_message)
        
      decrypted_message
    end
  end
end