require 'helper'

class TestDuration < Test::Unit::TestCase
  should "return value_of_duration" do
    [ [1024,0.125],[512,0.25], [256, 0.5], [128, 1], [64,2], [32,4], [16,8], [8,16], [4,32], [2,64],[1,128]].each do |i,v|
      assert_equal [[v, 0]], Rubypond::Duration.value_of_duration(i).first
    end
  end


  should "to_s" do
    [ [1024, '\maxima'], [512, '\longa'], [256, '\breve'], [128, '1'], [64,'2'], [32,'4'], [16, '8'], [8, '16'], [4, '32'], [2, '64'], [1, '128'] ].each do |i,v|
      assert_equal v, Rubypond::Duration.new(i).to_s
    end
  end


end
