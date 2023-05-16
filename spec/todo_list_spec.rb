require 'todo_list'

RSpec.describe TodoList do
  let(:todo_list) { TodoList.new }
  context "#list" do
    it "returns an empty array" do
      expect(todo_list.list).to eq []
    end

    it "returns 0 for incomplete todos when the list is empty" do
      expect(todo_list.incomplete).to eq 0
    end

    it "returns 0 for complete todos when the list is empty" do
      expect(todo_list.complete).to eq 0
    end
  end
end