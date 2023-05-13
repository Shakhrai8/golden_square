class VowelRemover
  def initialize(text)
    @text = text
    @vowels = ["a", "e", "i", "o", "u"]
  end

  def remove_vowels()
    i = @text.length - 1
    while i >= 0
      if @vowels.include? @text[i].downcase
        @text = @text.slice(0,i) + @text.slice(i+1..-1)
      end
      i -= 1
    end
    return @text
  end
end