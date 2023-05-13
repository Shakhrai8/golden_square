class Music
  def initialize
    @music_list = []
  end
  
  def list
    return @music_list
  end

  def add(music)
    fail "Error! Expected string not an integer!" if music.is_a? Integer
    @music_list << music
  end
end