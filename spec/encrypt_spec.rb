require 'spec_helper'

RSpec.describe Ratsel do
  let!(:encrypted_message) {
    Ratsel::Encrypt.new('lib/ratsel/test.txt', 'lib/ratsel/news-txt.txt')
  }

  describe ".encrypt" do
    it "should return the encrypted message" do
      expect(encrypted_message).to be_an_instance_of(Ratsel::Encrypt)
    end
  end

  # describe ".rotation_array" do
  #   it "should return a rotation array" do
  #     expect(Ratsel::Helpers.rotation_array('56789')).to eql([56, 67, 78, 89])
  #   end
  # end

  # describe ".sum_rotation_offset" do
  #   it "should return a rotation array" do
  #     offsets_array = [1, 0, 8, 9]
  #     rotation_array = [56, 67, 78, 89]
  #     expect(Ratsel::Helpers.sum_rotation_offset(offsets_array, rotation_array)).to eql([57, 67, 86, 98])
  #   end
  # end
end