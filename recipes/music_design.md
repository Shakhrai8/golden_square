# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem
> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.
## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class Music
  def initialize
    #....
  end

  def add(music)
    # music is a string which represents a name of the track
    # adds new music entry to the array
    # return nothing
  end

  def list
  # fails if given false music name
  # return a list of music tracks
  end
end
```

## 3. Create Examples as Tests

```ruby

# 1
music = Music.new
expect(music.list).to eq []
# => []

# 2
music = Music.new
music.add("Jingle Bells")
expect(music.list).to eq ["Jingle Bells"]
# => ["Jingle Bells"]

# 3 
music = Music.new
music.add("Track_1")
music.add("Track_2")
expect(music.list).to eq ["Track_1", "Track_2"]
# => ["Track_1", "Track_2"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._