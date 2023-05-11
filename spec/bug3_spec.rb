require 'bug_3'

RSpec.describe "get_most_common_letter method" do
  context "given string" do
    it "should return o back" do
      expect(get_most_common_letter("the roof, the roof, the roof is on fire!")).to eq "o"
    end
  end
end