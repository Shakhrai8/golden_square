require 'diary_entry_new'


RSpec.describe DiaryEntry do
  context "#title" do
    it "returns title" do
      entry = DiaryEntry.new("Title_1", "Contents_1")
      expect(entry.title).to eq "Title_1"
    end
  end

  context "#contents" do
    it "returns title" do
      entry = DiaryEntry.new("Title_1", "Contents_1")
      expect(entry.contents).to eq "Contents_1"
    end
  end

  context "#count_words" do
    it "should return 10" do
      entry_1 = DiaryEntry.new("Title_1", "Contents_1")
      entry_2 = DiaryEntry.new("Title_2", "Four")
      expect(entry_1.count_words).to eq 10
    end
  end

  context "#reading_time" do
    it "fails" do
      entry = DiaryEntry.new("Title_1", "Contents_1")
      expect{ entry.reading_time(-1)}.to raise_error("Wpm value must be above 0!")
    end

    it "should return 1" do
      entry = DiaryEntry.new("Title_1", "Contents_1")
      expect(entry.reading_time(10)).to eq 1
    end

    it "should return 11" do
      entry = DiaryEntry.new("Title_1", "12345678911")
      expect(entry.reading_time(1)).to eq 11
    end
  end

  context "#reading_chunk" do
    it "fails" do
      entry = DiaryEntry.new("Title_1", "12345678911")
      expect{ entry.reading_chunk(-1, 10) }.to raise_error("Wpm value must be above 0!")
    end

    it "should return 'one' " do
      entry = DiaryEntry.new("Title_1", "one two three")
      expect(entry.reading_chunk(1, 1)).to eq "one"
    end

    it "should return 'three' " do
      entry = DiaryEntry.new("Title_1", "one two three")
      entry.reading_chunk(2, 1)
      expect(entry.reading_chunk(1, 1)).to eq "three"
    end
  end
end
      