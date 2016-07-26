require 'observer'

class Fighter
  include Observable

  attr_reader :name, :health
  def initialize(args)
    @name = args[:name]
    @health = args[:health] || 10
    @attack_power = args[:attack_power] || 1
  end

  def fight(encounter)
    enemies = encounter.enemies(self)
    enemy = enemies[rand(enemies.length)]
    attack(enemy)
    # enemies.each { |enemy|
      # }
  end

  def attack(enemy)
    puts "#{name} hits #{enemy.name} for #{@attack_power} damage!"
    enemy.defend(@attack_power, self)
  end

  def defend(damage, enemy)
    @health -= damage
    if dead
      @health = 0 # avoid negative health
      notify_observers(self, 'dead')
    end
  end

  def dead
    @health <= 0
  end
end
