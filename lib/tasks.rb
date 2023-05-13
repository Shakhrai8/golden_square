class Tasks
  def initialize 
    @arr = []
  end

  def add(task) 
    @arr << task
  end

  def list
    return @arr
  end
  
  def complete(task)
    fail "No such task." unless @arr.include? task
    @arr.delete(task)
  end
end