require 'observer'

class Fighter
  include Observable

  Resource = Struct.new(:max, :current)

  attr_reader :name, :health, :mana
  def initialize(args)
    @name = args[:name]
    health = args[:health] || 10
    mana = args[:mana] || 0
    @health = Resource.new(health,health)
    @mana = Resource.new(mana,mana)
    @attack_power = args[:attack_power] || 1
    puts "#{name} - #{self.class.name} - health #{@health.max} - attack #{@attack_power}"
  end

  def fight(encounter)
    enemies = encounter.enemies(self)
    enemy = enemies[rand(enemies.length)]
    attack(enemy)
  end

  def attack(enemy)
    puts "#{name} hits #{enemy.name} for #{attack_power} damage!"
    enemy.defend(attack_power, self)
  end

  def defend(damage, enemy)
    @health.current -= damage
    if dead
      changed
      @health.current = 0 # avoid negative health
      notify_observers(self, 'dead')
    end
  end

  def attack_power
    @attack_power
  end

  def dead
    @health.current <= 0
  end
end
