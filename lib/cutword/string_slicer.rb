module Cutword
    class << self
       def slicer(text, max_length)
         if text.length > max_length
           text[0...max_length] + '...'
         else
           text
         end
       end
    end
end
   