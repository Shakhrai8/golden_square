require 'track_task'

RSpec.describe "track_task method" do
  context "given an empty string" do
    it "should return an error message" do
      expect{track_task("")}.to raise_error "No text found!" 
    end
  end

  context "given a wrong string" do
    it "should return false" do
      expect(track_task("Apple")).to eq false
    end

    it "should return false" do
      expect(track_task("asdasdas#todoasdasd")).to eq false
    end
  end

  context "given a right string" do
   
    it "should return true" do
      expect(track_task("#TODO")).to eq true
    end

     it "should return true" do
      expect(track_task("Hello #TODO World?")).to eq true
    end

    it "should return true" do
      expect(track_task("Iwasgoing#TODOsomehomework#∞¢3423")).to eq true
    end
  end 
end