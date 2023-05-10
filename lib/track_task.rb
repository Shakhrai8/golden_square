def track_task(str)
  fail "No text found!" if str.empty?
  if str.include? ("#TODO")
    return true
  else
    return false
  end
end