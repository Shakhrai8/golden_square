require 'music'


RSpec.describe Music do
  describe "#add" do
    before do
      @music = Music.new
    end
    
    context "when adding a string to the music list" do
      it "adds the string to the list" do
        @music.add("pop")
        expect(@music.list).to eq ["pop"]
      end
    end
    
    context "when adding an integer to the music list" do
      it "raises an error" do
        expect { @music.add(123) }.to raise_error("Error! Expected string not an integer!")
      end
      
      it "does not add the integer to the list" do
        begin
          @music.add(123)
        rescue
        end
        expect(@music.list).to eq []
      end
    end
  end
end