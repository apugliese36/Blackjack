require_relative "card"
require_relative "deck"

class Hand
  attr_accessor :cards
  attr_reader :name

  def initialize(name, cards = [])
    @name = name
    @cards = cards
    @score = 0
  end

  def get_score
    @score = 0
    @cards.each do |card|
      @score += card.value
    end

    if @score > 21
      ace_count = @cards.count { |card| card.rank == "A"}

        ace_count.times do
          @score -= 10
          if @score <= 21
            break
          end
        end
    end
    @score
  end
end
