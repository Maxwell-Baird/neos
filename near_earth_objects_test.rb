require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test

  def setup
    @results = NearEarthObjects.new('2019-03-30')
  end

  def test_it_exist
    assert_instance_of NearEarthObjects, @results
  end

  def test_it_can_return_total_number_of_astroids
    assert_equal 12, @results.total_number_of_astroids
  end

  def test_it_can_return_largest_astroid_diameter
    assert_equal 10233, @results.largest_astroid_diameter
  end

  def test_it_can_formatted_asteroid_data
    assert_instance_of Array, @results.formatted_asteroid_data
    assert_equal '(2019 GD4)',@results.formatted_asteroid_data.first[:name]
    assert_equal '61 ft',@results.formatted_asteroid_data.first[:diameter]
    assert_equal '911947 miles',@results.formatted_asteroid_data.first[:miss_distance]
  end

  def test_it_can_return_asteroid_data
    expected = [{:name=>"(2019 GD4)", :diameter=>"61 ft", :miss_distance=>"911947 miles"},
                {:name=>"(2019 GN1)", :diameter=>"147 ft", :miss_distance=>"9626470 miles"},
                {:name=>"(2019 GN3)", :diameter=>"537 ft", :miss_distance=>"35277204 miles"},
                {:name=>"(2019 GB)", :diameter=>"81 ft", :miss_distance=>"553908 miles"},
                {:name=>"(2019 FQ2)", :diameter=>"70 ft", :miss_distance=>"2788140 miles"},
                {:name=>"(2011 GE3)", :diameter=>"123 ft", :miss_distance=>"35542652 miles"},
                {:name=>"(2019 FT)", :diameter=>"512 ft", :miss_distance=>"5503325 miles"},
                {:name=>"(2019 FS1)", :diameter=>"134 ft", :miss_distance=>"6241521 miles"},
                {:name=>"141484 (2002 DB4)", :diameter=>"10233 ft", :miss_distance=>"37046029 miles"},
                {:name=>"(2011 GK44)", :diameter=>"147 ft", :miss_distance=>"10701438 miles"},
                {:name=>"(2012 QH8)", :diameter=>"1071 ft", :miss_distance=>"37428269 miles"},
                {:name=>"(2019 UZ)", :diameter=>"51 ft", :miss_distance=>"37755577 miles"}]

    assert_instance_of Hash, @results.astroid_details
    assert_equal 10233,@results.astroid_details[:biggest_astroid]
    assert_equal 12,@results.astroid_details[:total_number_of_astroids]
    assert_equal expected,@results.astroid_details[:astroid_list]
  end
end
