require "observer"

class Encounter
  def initialize(args)
    @fighters = args[:fighters]
    @fighters.each { |fighter|
      fighter.add_observer(self)}
  end

  def start
    i = 0
    while !winner do
      fighter = @fighters[i]
      if !fighter.dead
        fighter.fight(self)
        status
      end
      i += 1
      if i == @fighters.length
        i = 0
      end
    end
    puts "#{winner.name} wins!!!"
  end

  def enemies(fighter)
    @fighters.select do |enemy|
      !enemy.dead && fighter != enemy
    end
  end

  def winner
    alive = @fighters.select { |fighter|
      !fighter.dead}
    alive.length == 1 ? alive[0] : nil
  end

  def status
    results = []
    @fighters.each { |fighter|
      results.push("#{fighter.name} #{fighter.health}")}
    puts results.join(" | ")
  end

  def update(fighter, event)
    puts "#{fighter.name} has died!"
  end
end

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
      notify_observers(self, "dead")
    end
  end

  def dead
    @health <= 0
  end
end

if __FILE__ == $0
  fighters = [
    Fighter.new(
      :name => "Tom",
      :attack_power => rand(5)+2),
    Fighter.new(
      :name => "Dick",
      :attack_power => rand(5)+2),
    Fighter.new(
      :name => "Harry",
      :attack_power => rand(5)+2)
  ]
  encounter = Encounter.new(
    :fighters => fighters)

  encounter.start
end
