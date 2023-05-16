require 'diary_entry_new'

RSpec.describe DiaryEntry do
  let(:entry_1) { DiaryEntry.new("Monday", "Lorem ipsum.") }
  let(:entry_2) { DiaryEntry.new("Monday", "") }
  let(:entry_3) { DiaryEntry.new("Title", "one two three") }
  
  describe "when creating a new diary entry" do
    it "returns a diary entry" do
      expect(entry_1.title).to eq("Monday")
      expect(entry_1.contents).to eq("Lorem ipsum.")
    end
  end

  describe "when given a diary entry" do
    it "returns the number of words in the entry" do
      expect(entry_1.count_words).to eq(2)
    end

    it "returns 0 for an empty entry" do
      expect(entry_2.count_words).to eq(0)
    end
  end

  describe "when given a reading speed" do
    let(:diary_entry) { DiaryEntry.new("Title", "one two three") }

    it "returns the correct reading time for a given wpm" do
      expect(diary_entry.reading_time(1)).to eq(3)
      expect(diary_entry.reading_time(2)).to eq(2)
      expect(diary_entry.reading_time(10)).to eq(1)
    end

    it "raises an error unless wpm is positive" do
      expect { diary_entry.reading_time(-1) }.to raise_error(RuntimeError, "Wpm value must be above 0!")
    end
  end

  describe "when given a reading speed and number of minutes" do

    it "returns a chunk for a given wpm and minutes" do
      expect(entry_3.reading_chunk(1, 2)).to eq("one two")
      expect(entry_3.reading_chunk(2, 1)).to eq("three")
    end

    it "fails when given negative wpm" do
      expect { entry_3.reading_chunk(-1, 1) }.to raise_error(RuntimeError, "Wpm value must be above 0!")
    end
  end
end
