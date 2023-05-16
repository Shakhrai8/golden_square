require 'todo'

RSpec.describe Todo do
  let(:todo_1) { Todo.new("Task_1") }
  let(:todo_2) { Todo.new("") }
  let(:todo_3) { Todo.new("Task_2") }

  context "#task" do
    it "returns an empty array" do
      expect(todo_2.task).to eq ""
    end

    it "should return task" do
      expect(todo_1.task).to eq "Task_1"
    end
  end

  context "#mark_done!" do
    it "returns true" do
      expect(todo_1.mark_done!).to eq true
    end
  end

  context "#done!" do
    it "returns true" do
      todo_1.mark_done!
      expect(todo_1.done?).to eq true
    end

    it "returns false" do
      todo_3.mark_done!
      expect(todo_1.done?).to eq false
    end

    it "returns false" do
      todo_1.mark_done!
      todo_3.mark_done!
      expect(todo_1.done?).to eq true
    end
  end
end