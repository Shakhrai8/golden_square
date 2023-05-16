require 'todo_list'
require 'todo'

RSpec.describe "Todo Integration" do
  let(:todo_list) { TodoList.new }
  let(:todo_1) { Todo.new("Task_1") }
  let(:todo_2) { Todo.new("Task_2") }
  let(:todo_3) { Todo.new("Task_3") }
  let(:todo_4) { Todo.new("Task_4") }

  context "#add an instance of Todo and #list it" do
    it "returns an instance/s of Todo in form of a list" do
      todo_list.add(todo_1)
      expect(todo_list.list).to eq [todo_1]
    end

    it "returns an instance/s of Todo in form of a list" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.list).to eq [todo_1, todo_2]
    end

    it "returns multiple todos in the correct order" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      expect(todo_list.list).to eq [todo_1, todo_2, todo_3]
    end
  end

  context "check the #incomplete todos" do
    it "returns 0" do
      todo_list.add(todo_1)
      todo_1.mark_done!
      expect(todo_list.incomplete).to eq 0
    end

    it "returns incompleted todo" do
      todo_list.add(todo_1)
      expect(todo_list.incomplete).to eq "Task_1"
    end
  end

  context "check the #completed todos" do
    it "returns completed todo" do
      todo_list.add(todo_1)
      todo_1.mark_done!
      expect(todo_list.complete).to eq "Task_1"
    end

    it "returns 0" do
      todo_list.add(todo_1)
      expect(todo_list.complete).to eq 0
    end

    it "returns completed todos with their task descriptions" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      todo_1.mark_done!
      todo_3.mark_done!
      expect(todo_list.complete).to eq "Task_1, Task_3"
    end
  end

  context "check both #incomplete and #complete methods" do
    it "returns 1 completed and 1 incompleted todo" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.complete).to eq "Task_1"
      expect(todo_list.incomplete).to eq "Task_2"
    end

    it "returns 2 completed and 1 incomplete todo" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_1.mark_done!
      todo_3.mark_done!
      expect(todo_list.complete).to eq "Task_1, Task_3"
      expect(todo_list.incomplete).to eq "Task_2"
    end

    it "returns 4 completed todos and 0 for incomplete" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      todo_1.mark_done!
      todo_3.mark_done!
      todo_2.mark_done!
      todo_4.mark_done!
      expect(todo_list.complete).to eq "Task_1, Task_2, Task_3, Task_4"
      expect(todo_list.incomplete).to eq 0
    end

    it "returns 4 incompleted todos and 0 for complete" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      expect(todo_list.incomplete).to eq "Task_1, Task_2, Task_3, Task_4"
      expect(todo_list.complete).to eq 0
    end

    it "marks todos as done in a specific order" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_2.mark_done!
      todo_1.mark_done!
      expect(todo_list.complete).to eq "Task_1, Task_2"
      expect(todo_list.incomplete).to eq "Task_3"
    end
  end

  context "#give_up! and mark all todos as completed" do
    it "returns all todos as complete" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      todo_list.give_up!
      expect(todo_list.complete).to eq "Task_1, Task_2, Task_3, Task_4"
      expect(todo_list.incomplete).to eq 0
    end

    it "returns all todos as complete" do
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_2.mark_done!
      todo_list.add(todo_3)
      todo_list.add(todo_4)
      todo_list.give_up!
      expect(todo_list.complete).to eq "Task_1, Task_2, Task_3, Task_4"
      expect(todo_list.incomplete).to eq 0
    end
  end
end