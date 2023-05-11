require 'bug_2'

RSpec.describe "bug2 exercise" do
  context "encode method" do
    it "should return EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL" do
      expect(encode("theswiftfoxjumpedoverthelazydog", "secretkey")).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
    end
  end

  context "decode method" do
    it "should return theswiftfoxjumpedoverthelazydog" do
      expect(decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")).to eq "theswiftfoxjumpedoverthelazydog"
    end
  end
end