module Rubypond
  class Chord

    attr_reader :notes

    def initialize(notes)
      @notes = notes
    end

    def to_s
      "<< #{notes.join(' ')} >>"
    end

  end
end
