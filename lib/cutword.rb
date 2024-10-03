# lib/cutword.rb

def Cutword(max_length, text)
  if text.length > max_length
    truncated_text = text[0...max_length].strip
    truncated_text + (truncated_text.length < text.length ? '...' : '')
  else
    text
  end
end
