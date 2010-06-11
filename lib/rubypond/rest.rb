require 'rubypond/note'
module Rubypond
  class Rest < Note

    def initialize(duration,dots = nil)
      super('r', '',duration, dots)
    end

  end
end
