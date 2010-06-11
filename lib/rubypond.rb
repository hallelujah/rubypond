class Float
  unless const_defined?(:INFINITY)
    INFINITY = 1.0/0
  end
end

$:.unshift File.expand_path('../lib',__FILE__)
Dir[File.join(File.dirname(__FILE__),'**/*.rb')].each do |lib|
  require lib
end
module Rubypond
end
