require 'rspec'
require 'diary_new'
require 'diary_entry_new'

RSpec.describe "integration" do
  let(:diary) { Diary.new }
  let(:entry_1) { DiaryEntry.new("Title_1", "Contents_1") }
  let(:entry_2) { DiaryEntry.new("Title_2", "Contents_2") }
  let(:entry_3) { DiaryEntry.new("Title_3", "one two three") }
  let(:entry_4) { DiaryEntry.new("Title_4", "one two three four five six") }
  let(:entry_5) { DiaryEntry.new("Title_5", "1 2 3 4 5 6 7 8 9") }
  let(:entry_6) { DiaryEntry.new("Title_6", "one two") }
  let(:entry_7) { DiaryEntry.new("Title_7", "one 2") }
  let(:entry_8) { DiaryEntry.new("Title_8", "1 2 3 four five six") }
  let(:entry_9) { DiaryEntry.new("Title_9", "1 2 3 four five six seven eight") }
  let(:entry_10) { DiaryEntry.new("Title_10", "one two three four five") }


  context "given two diary entries" do
    it "returns a list of all diary entries" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end

    it "returns a list of all diary entries" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 2
    end
  end

  context "given 3 diary entries" do  
    it "returns a list of all diary entries" do
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_5)
      expect(diary.count_words).to eq 11
    end
  
    it "returns 3" do
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.reading_time(2)).to eq 3
    end
    
    it "returns 1" do
      diary.add(entry_4)
      diary.add(entry_6)
      diary.add(entry_3)
      expect(diary.reading_time(11)).to eq 1
    end

    it "fails" do
      diary.add(entry_4)
      diary.add(entry_6)
      diary.add(entry_3)
      expect{diary.reading_time(-2)}.to raise_error "Error: wpm should be a non-negative integer" 
    end
  end

  context "#find_best_entry_for_reading_time" do
    it "should return the closest entry which could be read within the time given" do
      diary.add(entry_8)
      diary.add(entry_7)
      diary.add(entry_3)
      expect(diary.find_best_entry_for_reading_time(3, 1)).to eq entry_3
    end

    it "should return the closest entry which could be read within the time given" do
      diary.add(entry_9)
      diary.add(entry_10)
      diary.add(entry_6)
      diary.add(entry_7)

      expect(diary.find_best_entry_for_reading_time(1, 5)).to eq entry_10
    end
  end
end