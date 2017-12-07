module Ratsel
  class Accessor
    # Read text from file
    def self.read_file_text(text_file)
      message = ''
      File.open(text_file, 'rb').each { |line| message += line }
      new_message = message.downcase.split('')
    end

    # Encryted info
    def self.write_encrypted_texts(text_file)
      encrypted_object = []
      File.open(text_file).each { |line|
        encrypted_object << line
      }

      encrypted_object
    end
  end
end