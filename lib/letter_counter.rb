class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0) # create a new hash with a default value of 0
    most_common = nil # initialize the most common letter to nil
    most_common_count = 1 # initialize the count of the most common letter to 1
    @text.chars.each do |char| # iterate over each character in the text string
      next unless is_letter?(char) # skip non-letter characters
      counter[char] = (counter[char] || 1) + 1 # increment the counter for the current character
      if counter[char] > most_common_count # check if the current character is now the most common
        most_common = char # update the most common letter
        most_common_count = counter[char] # update the count of the most common letter
      end
    end
    return [most_common_count, most_common] # return an array containing the count and letter of the most common letter
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Output:
# [2, "i"]