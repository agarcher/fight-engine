require_relative 'encounter'
require_relative 'fighter'

fighters = [
  Fighter.new(
    :name => 'Tom',
    :attack_power => rand(5)+2),
  Fighter.new(
    :name => 'Dick',
    :attack_power => rand(5)+2),
  Fighter.new(
    :name => 'Harry',
    :attack_power => rand(5)+2)
]
encounter = Encounter.new(
  :fighters => fighters)

encounter.start
