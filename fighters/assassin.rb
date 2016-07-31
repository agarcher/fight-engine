require_relative 'fighter'

class Assassin < Fighter
  def attack_power
    (@attack_power * 1.8).ceil
  end
end
