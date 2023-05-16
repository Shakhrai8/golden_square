require 'diary_new'

RSpec.describe Diary do
  context "initialy" do
    it "should return an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end

    it "should return 0" do
      diary = Diary.new
      expect(diary.count_words).to eq 0
    end
  end
end
