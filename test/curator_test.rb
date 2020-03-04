require "minitest/autorun"
require "minitest/pride"
require "./lib/curator"
require "./lib/photograph"
require "./lib/artist"

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_it_has_attributes
    assert_equal [], @curator.photographs
  end
end
