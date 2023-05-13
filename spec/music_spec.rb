require 'music'

RSpec.describe Music do
  context "given no music tracks" do
    it "returns an empty array" do
      music = Music.new
      expect(music.list).to eq []
    end
  end

  context "given one music track" do
    it "returns an array with one music track" do
      music = Music.new
      music.add("Jingle Bells")
      expect(music.list).to eq ["Jingle Bells"]
    end
  end

  context "given one music track" do
    it "returns an array with one music track" do
      music = Music.new
      music.add("Track_1")
      music.add("Track_2")
      expect(music.list).to eq ["Track_1", "Track_2"]
    end
  end
end