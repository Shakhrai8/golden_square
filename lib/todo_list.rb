class TodoList
  def initialize
    @list = []
  end

  def list
    @list
  end

  def add(todo) # todo is an instance of Todo
    @list << todo
  end

  def incomplete
    # iterating over each element in @list. If a Todo object is marked 
    # as done (todo.done? returns true), it is replaced with nil in 
    # the resulting array, otherwise task is returned
    incomplete_tasks = @list.map do |todo|
      todo.done? ? nil : todo.task
    # the compact method is to remove any nil values from the incomplete_list array.
    end.compact
    # we check if incomplete_tasks is empty using the empty? method. If it is empty, 
    # indicating that there are no incomplete todos, we assign 0 directly to 
    # the result variable. Otherwise, we join the task descriptions (", ") 
    # and store the resulting string in the result variable.
    incomplete_result = incomplete_tasks.empty? ? 0 : incomplete_tasks.join(", ")
  end

  def complete
    #similar syntax as in incomplete method, just reversed
    complete_tasks = @list.map do |todo|
      todo.done? ? todo.task : nil
    end.compact
    
    complete_result = complete_tasks.empty? ? 0 : complete_tasks.join(", ")
  end

  def give_up!
    @list.each { |todo| todo.mark_done! }
  end
end
