require_relative '../fighters/fighter'

module FighterInterfaceTest
  def test_responds_to_default_health
    assert_respond_to(@object, :default_health)
  end

  def test_responds_to_default_mana
    assert_respond_to(@object, :default_mana)
  end

  def test_responds_to_initiative
    assert_respond_to(@object, :initiative)
  end

  def test_responds_to_fight
    assert_respond_to(@object, :fight)
  end

  def test_responds_to_defend
    assert_respond_to(@object, :defend)
  end

  def test_responds_to_dead
    assert_respond_to(@object, :dead)
  end
end
