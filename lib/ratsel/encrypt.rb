require_relative "helpers/accessor"
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
      @encryption_key = (1..5).map { (1..9).to_a[rand(9)] }.join
      @offsets_array = Helpers.offsets_array(@encryption_date)
      @rotation_array = Helpers.rotation_array(@encryption_key)
      @sum_rotation_offset = Helpers.sum_rotation_offset(@offsets_array, @rotation_array)
    end

    def encrypt
      begin
        @message = Accessor.read_file_text(@message_txt)

        encrypted_message = Ratsel::Batch.get_batch(@message, @sum_rotation_offset)

        log_message(encrypted_txt, encryption_key, encryption_date)

        Accessor.write_encrypted_texts(encrypted_txt, encrypted_message)
    
        encrypted_message

      rescue TypeError => e
        puts "#{e}\nMake sure the characters in your text file are numbers, letters, a period, space or comma."
      end
    end
  end
end