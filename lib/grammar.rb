def grammar(str)
  fail "Not a sentence." if str.empty?
  first_letter_up = str[0] == str[0].upcase
  last_letter_mark = [".", "!", "?"].include? str[-1]
  if first_letter_up && last_letter_mark
    return true
  else
    return false
  end
end