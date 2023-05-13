require 'Tasks'

RSpec.describe Tasks do
  context "given an empty string" do
    it "should return empty list" do
      todo = Tasks.new
      expect(todo.list).to eq []
    end
  end

  context "given an instruction" do
    it "returns list of instructions" do
      todo = Tasks.new
      todo.add("Wash the cat")
      expect(todo.list).to eq ["Wash the cat"]
    end

    it "fails" do
      todo = Tasks.new
      todo.add("Wash the cat")
      expect{todo.complete("Wash the sheep")}.to raise_error "No such task."
    end
  end

  context "given multiple instructions" do
    it "returs list of instructions" do
      todo = Tasks.new
      todo.add("Wash the cat")
      todo.add("Wash the dog")
      expect(todo.list).to eq ["Wash the cat", "Wash the dog"]
    end

    it "returs list of instructions without the completed ones" do
      todo = Tasks.new
      todo.add("Wash the cat")
      todo.add("Wash the dog")
      todo.complete("Wash the cat")
      expect(todo.list).to eq ["Wash the dog"]
    end
  end
end