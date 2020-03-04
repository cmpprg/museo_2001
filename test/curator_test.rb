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

  end
end
