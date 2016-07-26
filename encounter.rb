require_relative 'fighter'

class Encounter
  def initialize(args)
    @fighters = args[:fighters]
    @fighters.each { |fighter|
      fighter.add_observer(self)}
  end

  def start
    i = 0
    puts "Press enter to start"
    while !winner do
      fighter = @fighters[i]
      if !fighter.dead
        gets
        fighter.fight(self)
        status
      end
      i += 1
      if i == @fighters.length
        i = 0
      end
    end
    puts "\n#{winner.name} wins!!!"
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
