# Storing player attributes: name and lives
# adjusting player's behavior

class Player
  attr_accessor :name
  attr_reader :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def is_dead?
    @lives <= 0
  end

  def loose_life
    @lives -= 1
  end
end