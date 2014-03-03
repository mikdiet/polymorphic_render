require 'test_helper'

class PolymorphicRenderTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, PolymorphicRender
  end
end
