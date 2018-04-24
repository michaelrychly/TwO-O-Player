# Storing game attributes: tasks, turns
# adjusting game's behavior: game loop, current user
require "./player.rb"

class Game
  attr_accessor :number1
  attr_accessor :number2
  attr_accessor :result

  def initialize
    @number1 = number1
    @number2 = number2
    @result = result
  end

  player1 = Player.new("Michael")
  player2 = Player.new("Paul")

  def play
    pick_question
    answer = gets.chomp
    if answer == result
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
    end
  end
#  while()

 # end

  def new_turn
    puts "-----New Turn-----"
  end

  def pick_question
    number1 = rand(20)
    number2 = rand(20)
    result = number1 + number2
    puts "What does #{number1} plus #{number2} equal?"
  end

  def show_standing
    puts "#{player1.name} #{player1.lives}/3 #{player2.name} #{player2.lives}/3"
  end

end
