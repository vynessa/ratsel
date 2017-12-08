require 'spec_helper'

RSpec.describe Ratsel do
  describe ".offsets_array" do
    it "should return the offsets" do
      expect(Ratsel::Helpers.offsets_array('071217')).to eql([1, 0, 8, 9])
    end

    it "should return the length of the array as 4" do
      expect(Ratsel::Helpers.rotation_array('071217').length).to eql(4)
    end
  end

  describe ".rotation_array" do
    it "should return a rotation array" do
      expect(Ratsel::Helpers.rotation_array('56789')).to eql([56, 67, 78, 89])
    end

    it "should return the length of the array as 4" do
      expect(Ratsel::Helpers.rotation_array('56789').length).to eql(4)
    end
  end

  describe ".sum_rotation_offset" do
    it "should return the sum of the rotator and offsets" do
      offsets_array = [1, 0, 8, 9]
      rotation_array = [56, 67, 78, 89]
      expect(Ratsel::Helpers.sum_rotation_offset(
        offsets_array,
        rotation_array)).to eql([57, 67, 86, 98])
    end

    it "should return the length of the sum as 4" do
      offsets_array = [1, 0, 8, 9]
      rotation_array = [56, 67, 78, 89]
      expect(Ratsel::Helpers.sum_rotation_offset(
        offsets_array,
        rotation_array).length).to eql(4)
    end
  end
end
