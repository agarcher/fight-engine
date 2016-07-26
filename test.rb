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
    :attack_power => rand(5)+2),
  Fighter.new(
    :name => 'John',
    :health => 20,
    :attack_power => rand(2)+1),
  Fighter.new(
    :name => 'Wayne',
    :health => 15,
    :attack_power => rand(2)+2)
]
encounter = Encounter.new(
  :fighters => fighters)

encounter.start
