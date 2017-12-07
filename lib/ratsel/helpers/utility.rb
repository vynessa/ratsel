module Ratsel
  class Utility
    def self.encrypt
      puts(<<-HERE)
        Encrypting a message file
        
        Usage:
        encrypt <file> [<output>]
        
        Options:
        <file>\t\t The path to the input file to be encrypted.
        <output>\t The path to the output file to save the encrypted text.
        HERE
      end
  
      def self.decrypt
        puts(<<-HERE)
          Decrypting an encrypted message file
          
          Usage:
          decrypt <encrypted-file> [<output>] <key> <date>
          
          Options:
          <encrypted-file>\t The path to the input encrypted file to be decrypted.
          <output>\t         The path to the output file to save the plain text.
          <key>\t\t          The key used to encrypt the file.
          <date>\t           The encryption date in DDMMYY format (eg. 221117)
          HERE
      end
  
      def self.crack
        puts(<<-HERE)
          Cracking a message file encrypted with Ratsel, given that you are a spy\n
          who knows the \"encryption date\"
          
          Usage:
          crack <encrypted-file> [<output>] <date>
          
          Options:
          <encrypted-file>\t The path to the encrypted file to be decrypted.
          <output>\t         The path to the output file used in saving the resulting plain text.
          <date>\t\t The encryption date in DDMMYY format (eg. 221117).
          HERE
      end
    end
  end