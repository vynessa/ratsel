require 'spec_helper'
# require 'json'
# require 'stringio'

RSpec.describe Ratsel do
  describe ".accessor" do
    it "should return the encrypted message" do
      @buffer = StringIO.new()
      @filename = "new.txt"
      @content = "oij5vbfxspmqfcc7kc9"
      allow(File).to receive(:open).with(@filename, 'w').and_yield(@buffer)
    
      # call the function that writes to the file
      Ratsel::Accessor.write_encrypted_texts(@filename, @content)

      # reading the buffer and checking its content.
      expect(@buffer.string).to eq(@content)
    end
  end
end
