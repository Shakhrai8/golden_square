# {{PROBLEM}} Method Design Recipe
## 1. Describe the Problem
> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a suitable > sentence-ending punctuation mark.
## 2. Design the Method Signature
_Include the name of the method, its parameters, return value, and side effects._
```ruby
grammar(text)
# text is a string with a words in it
# grammar is a boolean value which returns either true or wrong
```
## 3. Create Examples as Tests
_Make a list of examples of what the method will take and return._
```ruby
# 1th Example
grammar("")
# => fails

# 2th Example
grammar("Hello World.")
# => true

# 3th Example
grammar("Hello world")
# => false

# 4th Example
grammar("hello World!")
# => false

# 5th Example
grammar("hello World")
# => false

# 6th Example
grammar("Hello World!")
# => true

# 7th Example
grammar("Hello World?")
# => true

```
_Encode each example as a test. You can add to the above list as you go._
## 4. Implement the Behaviour
_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._