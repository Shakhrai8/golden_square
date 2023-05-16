require 'diary_new'

RSpec.describe Diary do
  let(:diary) { Diary.new }
  context "initialy" do
    it "should return an empty array" do
      expect(diary.all).to eq []
    end

    it "should return 0" do
      expect(diary.count_words).to eq 0
    end
  end
end
