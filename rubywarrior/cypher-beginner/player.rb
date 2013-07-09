module RubyWarrior::Units
  class Warrior < Base
    def max_health
      1000
    end
  end
end
 
class Player
  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot! :backward
    else
      warrior.feel.empty? ? warrior.walk! : warrior.attack!
    end
  end
end