require 'track'

RSpec.describe Track do
  context "" do
    it "constructs" do
      track = Track.new("my_title", "my_artist")
      expect(track.title).to eq "my_title"
      expect(track.artist).to eq "my_artist"
    end
  end
end