module Ratsel
  class Accessor
    # Read text from file
    def self.read_file_text(text_file)
      message = ''
      File.open(text_file).each { |line| message += line }
      new_message = message.downcase.split('')
    end

    # Encrypted info
    def self.write_encrypted_texts(encrypted_txt, encrypted_message)
      File.open(encrypted_txt, "w") do |line|
        line.write("#{encrypted_message}")    
      end
    end
  end
end