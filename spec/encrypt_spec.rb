require 'spec_helper'

RSpec.describe Ratsel do
  let!(:encrypted_message) {
    Ratsel::Encrypt.new('lib/ratsel/test.txt', 'lib/ratsel/news-txt.txt')
  }

  describe ".encrypt" do
    it "should return an instance of encrypted message" do
      expect(encrypted_message).to be_an_instance_of(Ratsel::Encrypt)
    end

    xit "should return the encrypted message" do
      expect(encrypted_message.encrypt).to eql('oij5vbfxspmqfcc7kc9')
    end
  end
end