# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 'King', 'Queen', 'Jack']

def blackjack_score (hand)
  score = 0
  hand.each do |card|
    if VALID_CARDS.include? card
      case card
      when 2, 3, 4, 5, 6, 7, 8, 9
        score += card
      when "Queen", "King", "Jack", 10
        score += 10
      end
    else
      raise ArgumentError, "Invalid Card"
    end
  end

  if hand.count(1) >= 1
    if hand.count(1) == 1
      if score <= 10
        score += 11
      elsif score > 10
        score += 1
      end
    elsif hand.count(1) > 1
      hand.count(1).times do
        if score + 11 >= 21
          score += 1
        else
          score += 11
        end
      end
    end
  end

  raise ArgumentError, "Bust!" if score > 21

  return score
end
