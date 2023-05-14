#integration test
require 'music_library'
require 'track'

RSpec.describe "Music Library Integration" do
  context "when we add a track to the library" do
    it "gets all tracks" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      track_2 = Track.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.all).to eq [track_1, track_2]
    end
  end
  
  context "with some tracks added" do
    it "searches for those tracks by full title" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      track_2 = Track.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.search_by_title("Synaesthesia")).to eq [track_2]
    end

    it "searches for those tracks by partial title" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      track_2 = Track.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.search_by_title("Syna")).to eq [track_2]
    end
  end

  context "where there are no tracks matching" do
    it "yeilds an empty list when searching" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      library.add(track_1)
      expect(library.search_by_title("Cala")).to eq []
    end
  end
end