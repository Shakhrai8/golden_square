def reading_time(str)
  words = str.split(" ") 
  return (words.length / 200.to_f).ceil
end