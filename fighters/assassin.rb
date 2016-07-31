require_relative 'fighter'

class Assassin < Fighter
  def attack_power
    (@attack_power * 1.7).ceil
  end
end
