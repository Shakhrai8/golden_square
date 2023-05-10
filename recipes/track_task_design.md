# {{PROBLEM}} Method Design Recipe
## 1. Describe the Problem
> As a user
> So that I can keep track of my tasks
> I want to check if a text includes the string #TODO.
## 2. Design the Method Signature
_Include the name of the method, its parameters, return value, and side effects._
```ruby
track_task(str)

```
## 3. Create Examples as Tests
_Make a list of examples of what the method will take and return._
```ruby
# 1th Example
track_task("")
# => fail "No text found!"

#2th Example
track_task("Apple")
# => false

#3th Example
track_task("#TODO")
# => true

#4th Example
track_task("Hello #TODO World?")
# => true

#5th Example
track_task("Iwasgoing#TODOsomehomework#∞¢3423")
# => true

#6th Example
track_task("asdasdas#todoasdasd")
# => false

```
_Encode each example as a test. You can add to the above list as you go._
## 4. Implement the Behaviour
_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._