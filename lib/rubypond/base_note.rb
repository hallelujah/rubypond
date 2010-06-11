module Rubypond
  class BaseNote

    attr_reader :name, :pitch

    class NotANoteError < StandardError; end

    def initialize(string, pitch)
      str,other = string.to_s.downcase.scan(/^([a-z])+/).flatten
      @pitch = Pitch.new(pitch)
      @name =  case str.to_s.downcase
               when 'r','soupir', 'rest'
                 :r
               when 'a', 'la'
                 :a
               when 'b', 'si'
                 :b
               when 'c', 'do'
                 :c
               when 'd', 're'
                 :d
               when 'e', 'mi'
                 :e
               when 'f', 'fa'
                 :f
               when 'g', 'sol'
                 :g
               else
                 raise NotANoteError
               end
    end

  end
end
