module Rubypond
  class Note
    attr_reader :base, :duration, :alteration

    def initialize(base,alteration,duration,dots = nil)
      @base = BaseNote.new(base, 0)
      @duration = Duration.new(duration, dots)
      @alteration = Alteration.new(alteration)
    end

    def to_s
     ["#{base.name}#{alteration}#{base.pitch}#{duration}",linked_notes].flatten.join(' ~ ')
    end

    def linked_notes
      duration.rests.map do |long,dots|
        Note.new(base.name,alteration.to_s,long,dots)
      end
    end

  end
end
