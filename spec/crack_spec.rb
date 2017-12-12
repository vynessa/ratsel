require 'spec_helper'

RSpec.describe Ratsel do
  let!(:cracked_message) {
    Ratsel::Crack.new(
      'lib/ratsel/news-txt.txt',
      'lib/ratsel/old-txt.txt',
      '071217'
    )
  }

  describe ".decrypt" do
    it "should return the decrypted message" do
      expect(cracked_message).to be_an_instance_of(Ratsel::Crack)
    end
  end
end