package blackjack

import "fmt"

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "ace":
		return 11
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten":
		return 10
	case "jack":
		return 10
	case "queen":
		return 10
	case "king":
		return 10
	case "other":
		return 0
	default:
		return 0

	}
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	value1 := ParseCard(card1)
	value2 := ParseCard(card2)
	dealerValue := ParseCard(dealerCard)
	total := value1 + value2
	fmt.Println(total)
	if value1 == 11 && value2 == 11 {
		return "P"
	}
	if total == 21 {
		if dealerValue != 11 && dealerValue != 10 {
			return "W"
		}
		return "S"
	}
	if total >= 17 && total <= 20 {
		return "S"
	}
	if total >= 12 && total <= 16 {
		if dealerValue >= 7 {
			return "H"
		}
		return "S"
	}
	return "H"

}

func main() {
	FirstTurn("jack", "jack", "ace")
}