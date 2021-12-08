# frozen_string_literal: true

require "test_helper"
require "jsender"

class TredoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tredo::VERSION
  end
end
