class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
  end

  def place_stones
   cups += stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if !start_posinclude?(Board)
      raise "Invalid String"
    else
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    start_pos.empty?
  end

  def next_turn(ending_cup_idx)
    ending_cup_idx.each do |i|
    if self[i] == 0
      @player2
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  return true if cups.empty?

  end

  def winner
    if cups.one_side_empty?
  end
end
