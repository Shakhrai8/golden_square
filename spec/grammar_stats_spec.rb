require 'grammar_stats'

RSpec.describe GrammarStats do
  describe "check method" do
    it "returns true for valid text" do
      gs = GrammarStats.new
      expect(gs.check("This is a valid sentence.")).to eq(true)
    end

    it "returns false for text that doesn't start with a capital letter" do
      gs = GrammarStats.new
      expect(gs.check("this is not valid.")).to eq(false)
    end

    it "returns false for text that doesn't end with sentence-ending punctuation" do
      gs = GrammarStats.new
      expect(gs.check("This is not valid")).to eq(false)
    end

    it "increments @good_texts when text is valid" do
      gs = GrammarStats.new
      expect {
        gs.check("This is a valid sentence.")
      }.to change { gs.instance_variable_get(:@good_texts) }.from(0).to(1)
    end
  end

  describe "percentage_good method" do
    it "returns 0 when no texts have been checked" do
      gs = GrammarStats.new
      expect(gs.percentage_good).to eq(0)
    end

    it "returns 100 when all texts checked are valid" do
      gs = GrammarStats.new
      gs.check("This is a valid sentence.")
      gs.check("Another valid sentence!")
      expect(gs.percentage_good).to eq(100)
    end

    it "returns correct percentage for mixed results" do
      gs = GrammarStats.new
      gs.check("This is a valid sentence.")
      gs.check("This is not valid")
      gs.check("Another valid sentence!")
      expect(gs.percentage_good).to eq(66)
    end
  end
end
