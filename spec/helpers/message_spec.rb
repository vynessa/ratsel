require 'spec_helper'

RSpec.describe Ratsel do
  # let(:filename) { '/text.txt' }
  # let(:key) { '45675' }
  # let(:date) { '071217' }

  describe ".message" do
    pending it "should return a message with the accurate parameters passed" do
      puts Ratsel::SendMessage
      expect(SendMessage::message(
        '/text.txt',
        '45675',
        '071217')).to eql("created /text.txt with key 45675 and date 071217")
    end
  end
end
