# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.
> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class Tasks
  def initialize 
    # ...
  end

  def add(task) # task is a string
    # adds new task
    # returns nothing
  end

  def list
    # returns list of todos
  end
  
  def complete(task)
    # Deletes chosen todo from the list
    # fails if the task doesnt exist
    # returns nothing
  end
end
```

## 3. Create Examples as Tests

```ruby

# 1
todo = Tasks.new
todo.list
# => []

# 2
todo = Tasks.new
todo.add("Wash the cat")
# => ["Wash the cat"]

# 3
todo = Tasks.new
todo.add("Wash the cat")
todo.add("Wash the dog")
# => ["Wash the cat", "Wash the dog"]

# 4
todo = Tasks.new
todo.add("Wash the cat")
todo.add("Wash the dog")
todo.complete("Wash the cat")
# => ["Wash the dog"]

# 5
todo = Tasks.new
todo.add("Wash the cat")
todo.complete("Wash the dog")
# => fails "No such task."

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._