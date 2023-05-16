require 'diary_entry_new'

RSpec.describe DiaryEntry do
  describe "when creating a new diary entry" do
    it "returns a diary entry" do
      diary_entry = DiaryEntry.new("Monday", "Lorem ipsum.")
      expect(diary_entry.title).to eq("Monday")
      expect(diary_entry.contents).to eq("Lorem ipsum.")
    end
  end

  describe "when given a diary entry" do
    it "returns the number of words in the entry" do
      diary_entry = DiaryEntry.new("Monday", "Lorem ipsum.")
      expect(diary_entry.count_words).to eq(2)
    end

    it "returns 0 for an empty entry" do
      diary_entry = DiaryEntry.new("Monday", "")
      expect(diary_entry.count_words).to eq(0)
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
    let(:diary_entry) { DiaryEntry.new("Title", "one two three") }

    it "returns a chunk for a given wpm and minutes" do
      expect(diary_entry.reading_chunk(1, 2)).to eq("one two")
      expect(diary_entry.reading_chunk(2, 1)).to eq("three")
    end

    it "fails when given negative wpm" do
      expect { diary_entry.reading_chunk(-1, 1) }.to raise_error(RuntimeError, "Wpm value must be above 0!")
    end
  end
end
