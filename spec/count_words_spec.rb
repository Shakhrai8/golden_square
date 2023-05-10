#A method called count_words that takes a string as an argument 
#and returns the number of words in that string.
require 'count_words'

RSpec.describe "count_words method" do
  context "takes an empty string" do
    it "should return 0" do
      result = count_words("")
      expect(result).to eq 0
    end
  end

  context "takes a string of five words" do
    it "should return 5" do
      result = count_words("one two three four five")
      expect(result).to eq 5
    end
  end

  context "takes a string of ten words" do
    it "should return 5" do
      result = count_words("one two three four five six seven eigth nine ten")
      expect(result).to eq 10
    end
  end
end