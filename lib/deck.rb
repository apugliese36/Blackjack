require_relative "card"
require_relative "hand"

SUITS = ['♠', '♣', '♥', '♦']
RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']


class Deck
  attr_accessor :collection

  def initialize
    @collection = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @collection << Card.new(rank, suit)
      end
    end

    @collection.shuffle!
  end

  def draw!
    @collection.pop
  end

  def deal(num, hand)
    response = ''
    num.times do
      hand.cards << draw!
      response += "#{hand.name} was dealt #{hand.cards[-1].suit_rank}\n"
    end
    response
  end

end
