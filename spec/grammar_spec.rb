require 'grammar'

RSpec.describe "grammar method" do
  context "given an empty string" do
    it "fails" do
      expect{grammar("")}.to raise_error "Not a sentence."
    end
  end

  context "given a sentence with a capital letter and a full stop" do
    it "returns true" do
      expect(grammar("Hello World.")).to eq true
    end
  end

  context "given a sentence with a full stop and no capital letter" do
    it "return false" do
      expect(grammar("hello World.")).to eq false
    end
  end

  context "given a sentence with a capital letter and no punctuation at the end" do
    it "return false" do
      expect(grammar("Hello World")).to eq false
    end
  end

  context "given a sentence with an exclamation mark and no capital letter" do
    it "return false" do
      expect(grammar("hello World!")).to eq false
    end
  end

  context "given a sentence with no capital letter and any punctuation marks at the end" do
    it "return false" do
      expect(grammar("hello World")).to eq false
    end
  end

  context "given a sentence with an exclamation mark and a capital letter" do
    it "return true" do
      expect(grammar("Hello World!")).to eq true
    end
  end

  context "given a sentence with an question mark and a capital letter" do
    it "return true" do
      expect(grammar("Hello World?")).to eq true
    end
  end
end