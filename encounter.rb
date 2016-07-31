class Encounter
  def initialize(args)
    @fighters = args[:fighters]
  end

  def start
    initiative
    @fighters.each { |fighter|
      fighter.add_observer(self)}

    # TODO: clean up this terrible looping
    i = 0
    puts "Press enter to start"
    while !winner do
      fighter = @fighters[i]
      if fighter.dead
        @fighters -= [fighter]
        i -= 1
      else
        gets
        fighter.fight(self)
        status
      end
      i += 1
      if i == @fighters.length
        i = 0
      end
    end
  end

  def initiative
    @fighters.sort! { |a,b|
      result = a.initiative <=> b.initiative
      result != 0 ? result : (rand(2) == 0 ? -1 : 1)}
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
    if winner
      puts "\n#{winner.name} wins!!!"
    else
      results = []
      @fighters.each { |fighter|
        if !fighter.dead
          results.push("#{fighter.name} #{fighter.health.current}")
        end}
      puts results.join(" | ")
    end
  end

  def update(fighter, event)
    puts "#{fighter.name} has died."
  end
end
