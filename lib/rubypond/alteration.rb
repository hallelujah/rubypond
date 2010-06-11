module Rubypond
  class Alteration

    attr_reader :name

    def initialize(name)
      @name = case name.to_s.downcase
             when 'd', 'is', 's' # SHARP == dièse
               :is
             when 'dd', 'isis', 'ss' # double dièse
               :isis
             when 'b', 'es','f' # FLAT == bémol
               :es
             when 'bb', 'eses', 'ff' # double bémol
               :eses
             when 'sd', 'ih', 'qs' # semi dièse
               :ih
             when 'dsd', 'isih','tqs' # sesqui dièse
               :isih
             when 'sb', 'eh', 'qf' # semi bémol
               :eh
             when 'bsb', 'eseh', 'tqf' # sesqui bémol
               :eseh
             when ''
               nil
             else
               raise AlterationNotFoundError
             end
    end

    def to_s
      "#{name}"
    end
  end
end
