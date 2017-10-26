require "spec_helper"

RSpec.describe Deck do
  # Your tests here
  let(:deck) { Deck.new }
  let(:hand) { Hand.new }

  describe ".new" do
    it "builds a deck of 52 cards" do
      expect(deck.collection.size).to eq(52)
    end

    it "each card is different in the deck" do
      expect(deck.collection.uniq.size).to eq(52)
    end
  end

  describe "#draw!" do
    it "return a card object and remove card from deck" do
      expect(deck.draw!).to be_a(Card)
    end
  end

  describe "#deal" do
    it "return 2 cards " do
      deck.deal(2,hand)

      expect(hand.cards.size).to eq(2)

    end

    it "it is a hand object" do
      deck.deal(2,hand)
      expect(hand).to be_a(Hand)
    end
  end

end
