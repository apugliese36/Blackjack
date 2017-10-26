require "spec_helper"

RSpec.describe Hand do
  let(:ace_hearts) {Card.new("A","♥")}
  let(:ace_spades) {Card.new("A","♠")}

  let(:empty_hand) { Hand.new }
  let(:hand) { Hand.new([Card.new(10,"♦"), Card.new("J","♥")]) }
  let(:hand1) { Hand.new([Card.new(10,"♦"), Card.new("J","♥"), ace_hearts]) }
  let(:hand2) { Hand.new([Card.new(9, "♦"), ace_hearts, ace_spades]) }
  let(:hand3) { Hand.new([ace_hearts, ace_hearts, ace_hearts, ace_hearts]) }
  let(:hand4) { Hand.new([Card.new(4,"♦"), ace_hearts, ace_hearts, ace_hearts]) }

  describe ".new" do
    it "takes an array of cards as argument" do
      expect(hand).to be_a(Hand)
    end

    it "takes no arguments empty hand" do
      expect(empty_hand).to be_a(Hand)
    end
  end


  describe "#cards" do
    it "has a reader for cards" do
      expect(hand.cards).to be_a(Array)
    end

    it "does NOT have a writer for cards" do
      empty_hand.cards << Card.new(10, "♦")
      expect(empty_hand.cards.count).to eq(1)
    end
  end

  describe "#score" do
    it "does NOT have a reader for score" do
      expect{hand.score}.to raise_error(NoMethodError)
    end

    it "does NOT have a writer for score" do
      expect{hand.score = 12}.to raise_error(NoMethodError)
    end
  end

  describe "#get_score" do

    it "calulates a hand's score" do
      expect(hand.get_score).to eq(20)
    end

    it "counts aces as 1 or 11 to yield best possible score" do
      expect(hand1.get_score).to eq(21)
      expect(hand2.get_score).to eq(21)
      expect(hand3.get_score).to eq(14)
      expect(hand4.get_score).to eq(17)
    end
  end

end
