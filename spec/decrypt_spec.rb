require 'spec_helper'

RSpec.describe Ratsel do
  let!(:decrypted_message) {
    Ratsel::Decrypt.new(
      'lib/ratsel/news-txt.txt',
      'lib/ratsel/old-txt.txt',
      '67498',
      '071217'
    )
  }

  describe ".decrypt" do
    it "should return an instance of decrypted message" do
      expect(decrypted_message).to be_an_instance_of(Ratsel::Decrypt)
    end

    xit "should return the decrypted message" do
      expect(decrypted_message.decrypt).to eql('hello hello ..end..')
    end
  end
end