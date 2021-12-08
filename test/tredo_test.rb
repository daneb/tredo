# frozen_string_literal: true

require "test_helper"

class TredoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tredo::VERSION
  end

  def test_success_creating_task
    tredo = Tredo.new
  end
end
