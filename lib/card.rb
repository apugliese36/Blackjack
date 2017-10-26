class Card
  attr_reader :rank, :suit
  attr_accessor :value

  def initialize (rank, suit)
    if ['J', 'Q', 'K'].include?(rank)
      @value = 10
    elsif ['A'].include?(rank)
      @value = 11
    else
      @value = rank
    end
    @rank = rank
    @suit = suit
  end

  def suit_rank
    "#{rank}#{suit}"
  end
end
