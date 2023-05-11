require 'diary_entry'

RSpec.describe DiaryEntry do
  context "given title and contents" do
    it "should return title and contents" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect(entry.title).to eq "march"
      
    end

    it "should return contents" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect(entry.contents).to eq "I want to sleep"
    end

    it "should return number of words in contents" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect(entry.count_words).to eq 4
    end
  end

  context "given words per minute value" do
    it "fails" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect{entry.reading_time(-1)}.to raise_error "Wpm value must be above 0!"
    end

    it "should return 1" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect(entry.reading_time(200)).to eq 1
    end

    it "should return 2" do
      entry = DiaryEntry.new("march", "Hello " * 400)
      expect(entry.reading_time(200)).to eq 2
    end

    it "should return 25" do
      entry = DiaryEntry.new("march", "Hello " * 5000)
      expect(entry.reading_time(200)).to eq 25
    end
  end

  context "given wpm and minutes value" do
    it "fails" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect{entry.reading_chunk(-1, 1)}.to raise_error "Wpm value must be above 0!"
    end

    it "should return chunk of text which can be readable within minutes value" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect(entry.reading_chunk(2, 2)). to eq "I want to sleep"
    end

    it "should return chunk of readable text" do
      entry = DiaryEntry.new("march", "I want to sleep")
      expect(entry.reading_chunk(1, 2)). to eq "I want"
    end

    it "should return last readable chunk of text" do
      entry = DiaryEntry.new("march", "I want to sleep")
      entry.reading_chunk(1, 2)
      expect(entry.reading_chunk(1, 2)). to eq "to sleep"
    end
  end
end