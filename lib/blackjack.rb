require_relative "card"
require_relative "deck"
require_relative "hand"

deck = Deck.new
player_hand = Hand.new("Player")
dealer_hand = Hand.new("Dealer")

puts "Welcome to Blackjack!\n\n"

puts deck.deal(2, player_hand)

puts "Players score: #{player_hand.get_score}\n\n"

if player_hand.get_score == 21
  puts "Blackjack! You Win!"
  exit
end

input = nil
while input != 's'
  print "Hit or Stand (H/S):"
  input = gets.chomp.downcase
  if input == 'h'
    puts deck.deal(1, player_hand)
    puts "Players score: #{player_hand.get_score}\n\n"
    if player_hand.get_score > 21
      puts "Bust! You lose..."
      exit
    end
  end
end

puts "\nPlayers score: #{player_hand.get_score}\n\n"

## DEALER TURN
  puts deck.deal(2, dealer_hand)
  puts "Dealer score: #{dealer_hand.get_score}\n\n"


while dealer_hand.get_score < 17
  puts deck.deal(1, dealer_hand)
  puts "Dealer score: #{dealer_hand.get_score}\n\n"
end

if dealer_hand.get_score > 21
  puts "Dealer busts. You win!"
elsif dealer_hand.get_score > player_hand.get_score
  puts "Dealer stands. Dealer wins!"
elsif player_hand.get_score > dealer_hand.get_score
  puts "Dealer stands. You win!"
else
  puts "IT'S A PUUUUUUSSSHHHHH!"
end
