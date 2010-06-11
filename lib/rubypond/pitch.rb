module Rubypond
  class Pitch

    attr_reader :symbol, :value

    def initialize(pitch = 0)
      @symbol = pitch > 0 ? "'" : ","
      @value = pitch.abs
    end

    def to_s
      symbol * value
    end

  end
end
