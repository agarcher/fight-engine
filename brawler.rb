require_relative 'fighter'

class Brawler < Fighter
  def attack_power
    @attack_power + (@health.max / 5).floor
  end
end
