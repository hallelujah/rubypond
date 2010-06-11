# Duration is based power 2
# The lowest duration is tuple croche == <note>128
# 1024/1024 == longue (soit 16 temps) longa                   | longa
# 512/1024 == carrée / brève (soit 8 temps)                   | breve
# 256/1024 == ronde == c1 (soit 4 temps)                      | semibreve
# 128/1024 == blanche == c2(soit 2 temps)                     | minim
# 64/1024 == noire == c4(soit 1 temps)                        | crotchet
# 32/1024 == croche == c8(soit 1/2 de temps)                  | quaver
# 16/1024 == double croche == c16(soit 1/4 ème de temps)      | semiquaver
# 8/1024 ==  triple croche == c32 (soit 1/8 ème de temps)     | demisemiquaver
# 4/1024 ==  quadruple croche == c64 (soit 1/16 ème de temps) | hemidemisemiquaver
# 2/1024 == octuple croche == c128 (soit 1/32 ème de temps)   | quasihemidemisemiquaver / semihemidemisemiquaver
module Rubypond
  class Duration

    attr_reader :rests,:value, :dots
    attr_accessor :multiple

    def initialize(rests, dots_count = nil)
      unless dots_count
        @rests,self.multiple = self.class.value_of_duration(rests.to_i)
        @rests.reverse!
        v, @dots =  @rests.shift
      else
        @dots = dots_count
        v = rests
        @rests = []
      end
      @value = case 1 / v 
               when (8..Float::INFINITY)
                 '\maxima'
               when 4
                 '\longa'
               when 2
                 '\breve'
               else
                 v.to_i
               end
    end

    def inspect
      "<##{self.class.name} {rests: #{rests.inspect},value: #{value.inspect}, dots: #{dots.inspect}}"
    end

    def to_s
      "#{value}#{'.' * dots}"
    end

    class << self
      def value_of_duration(integer)
        # euclidian division against maxim length
        multiple = integer.divmod(2048)
        # The penultimate rest of euclidian division against maxima length
        nb = 2048 * (multiple.first > 0 ? 1 : 0) + multiple.last

        binary = nb.to_s(2)
        array = binary.scan(/(1+|0+)/)
        size = 0
        a = array.reverse.map do |val,b|
          size += val.size
          # [note_value,dots_cout]
          next unless val =~ /^1/
            [1024.0 / (2 ** (size + 1)), val.size - 1]
        end.compact
        [a, multiple]
      end
    end
  end
end
