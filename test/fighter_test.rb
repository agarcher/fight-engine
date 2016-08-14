require 'minitest/autorun'
require_relative './fighter_interface_test'
require_relative '../fighters/fighter'

class FighterTest < MiniTest::Unit::TestCase
  include FighterInterfaceTest

  def setup
    @fighter = @object = Fighter.new(
      :name => 'TestFighter')
  end

  # TODO: I'm not sure about testing a function that is inherantly random
  def test_initiative_in_range
    assert_in_delta(@fighter.initiative, 4.5, 4.6)
  end
end
