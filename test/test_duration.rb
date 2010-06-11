require 'helper'

class TestDuration < Test::Unit::TestCase
  should "return value_of_duration" do
    [ [2048,0.125],[1024,0.25], [512, 0.5], [256, 1], [128,2], [64,4], [32,8], [16,16], [8,32], [4,64],[2,128]].each do |i,v|
      assert_equal [[v, 0]], Rubypond::Duration.value_of_duration(i).first
    end
  end


  should "to_s" do
    [ [2048, '\maxima'] ]

  end


end
