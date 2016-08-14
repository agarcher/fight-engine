require 'observer'
require_relative '../resource'

class Fighter
  include Observable

  attr_reader :name, :health, :mana, :attack_power
  def initialize(args)
    @name = args[:name]
    @health = Resource.new(args[:health] || default_health)
    @mana = Resource.new(args[:mana] || default_mana)
    @attack_power = args[:attack_power] || 1
    puts "#{name} - #{self.class.name} - health #{@health} - attack #{@attack_power}"
  end

  def default_health
    10
  end

  def default_mana
    0
  end

  def initiative
    @initiative ||= rand(10)
  end

  def fight(encounter)
    enemies = encounter.enemies(self)
    enemy = enemies[rand(enemies.length)]
    puts "#{name} hits #{enemy.name} for #{attack_power} damage!"
    enemy.defend(attack_power, self)
  end

  def defend(damage, attacker)
    @health -= damage
    if dead
      changed
      notify_observers(self, 'dead')
    end
  end

  def dead
    @health == 0
  end
end
