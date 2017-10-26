require "spec_helper"

describe Card do
    let (:card2) { Card.new(2, '♦') }
    let (:card3) { Card.new(3, '♦') }
    let (:cardJ) { Card.new('J', '♦') }
    let (:cardK) { Card.new('K', '♦') }
    let (:cardA1) { Card.new('A', '♦') }
    let (:cardA2) { Card.new('A', '♣') }
    let (:cardA3) { Card.new('A', '♠') }
    let (:cardA4) { Card.new('A', '♥') }

  describe "#rank" do
    it "returns the rank of a card" do
      expect(card2.rank).to eq(2)
      expect(card2.rank).to be_a(Fixnum)
      expect(cardJ.rank).to eq('J')
      expect(cardA1.rank).to eq('A')
    end
  end

  describe "#suit" do
    it "returns the rank of a card" do
      expect(card2.suit).to eq('♦')
      expect(card2.suit).to be_a(String)
      expect(cardJ.suit).to eq('♦')
      expect(cardA2.suit).to eq('♣')
    end
  end

  describe "#suit_rank"
    it "returns a single string of suit and rank" do
      expect(card2.suit_rank).to eq('2♦')
      expect(cardJ.suit_rank).to eq('J♦')
      expect(cardA3.suit_rank).to eq('A♠')
      expect(cardA4.suit_rank).to eq('A♥')
    end


  describe ".new" do
    it "creates a new card object" do
      expect(Card.new(3, '♦')).to be_a(Card)
    end

  end
end
