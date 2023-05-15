class DiaryEntry
  def initialize(title, contents) 
    @title = title
    @contents = contents
    @furthest_word_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.length
  end

  def reading_time(wpm) 
    fail "Wpm value must be above 0!" unless wpm.positive?
    return (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes) 
    fail "Wpm value must be above 0!" unless wpm.positive?
    finish = wpm * minutes
    starting = @furthest_word_read
    last_stop = @furthest_word_read + finish
    word_list = @contents.split(" ")[starting, last_stop]
    if last_stop >= count_words
      @furthest_word_read = 0
    else
      @furthest_word_read = last_stop
    end
    return word_list.join(" ")
  end
end