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
    @player1 = Player.new("Michael")
    @player2 = Player.new("Paul")
    @current_player = @player1
  end

  def play
    game_start
    while(not game_over?)
      pick_question
      answer = gets.chomp
      eval_answer(answer)
      show_standing
      new_turn
      next_player
    end
  end

private
  def game_start
    puts "A big welcome to #{@player1.name} and #{@player2.name} let's play TwO-O-Player"
  end

  def new_turn
    puts "-----New Turn-----"
  end

  def randomize_player
    @players.rotate!
  end

  def pick_question
    number1 = rand(20)
    number2 = rand(20)
    @result = number1 + number2
    puts "#{@current_player.name} what does #{number1} plus #{number2}?"
  end

  def eval_answer(answer)
    if answer.to_i == @result.to_i
      puts "YES! You are correct."
    else
      @current_player.loose_life
      puts "Seriously? No!"
    end
  end

  def next_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def show_standing
    puts "#{@player1.name} #{@player1.lives}/3 #{@player2.name} #{@player2.lives}/3"
  end

  def game_over?
    if @player1.is_dead?
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "-----Game over-----"
      puts "Goodbye!"
      true
    elsif @player2.is_dead?
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "-----Game over-----"
      puts "Goodbye!"
      true
    end
  end

end
