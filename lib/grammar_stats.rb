class GrammarStats
  def initialize
    @total_texts = 0
    @good_texts = 0
  end

  def check(text)
    first_char = text[0]
    last_char = text[-1]
    sentence_enders = ['.', '?', '!']
    if first_char == first_char.upcase && sentence_enders.include?(last_char)
      @good_texts += 1
    end
    @total_texts += 1
    return first_char == first_char.upcase && sentence_enders.include?(last_char)
  end

  def percentage_good
    if @total_texts == 0
      return 0
    else
      return (@good_texts.to_f / @total_texts * 100).to_i
    end
  end
end
