module Cutword
  class << self
    def get(text, max_length)
      if text.length > max_length
        truncated_text = text[0...max_length - 3].strip
        truncated_text + '...'
      else
        text
      end
    end
  end
end
