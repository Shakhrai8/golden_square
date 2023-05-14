#unit test
require 'music_library'


RSpec.describe MusicLibrary do
  context "initialy" do
    it "constructs" do
      library = MusicLibrary.new
      expect(library.all).to eq []
    end

    it "responds to searches with an empty list" do
      library = MusicLibrary.new
      expect(library.search_by_title("Cala")).to eq []
    end
  end
  # ...
end