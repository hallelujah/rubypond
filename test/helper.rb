dir = File.expand_path('../../../shoulda/lib', __FILE__)

$LOAD_PATH.unshift  dir
require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubypond'

class Test::Unit::TestCase
end
