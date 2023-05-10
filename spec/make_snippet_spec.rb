require 'make_snippet'

RSpec.describe "make_snippet method" do
  context "given an empty string" do
    it "returns an empty string" do
      result = make_snippet("")
      expect(result).to eq ""
    end
  end

  context "given a string of five words" do
    it "returns that string" do
      result = make_snippet("one two three four five")
      expect(result).to eq "one two three four five"
    end
  end

  context "given a string of six words" do
    it "returns the first five with a ..." do
      result = make_snippet("one two three four five six")
      expect(result).to eq "one two three four five..."
    end
  end
end