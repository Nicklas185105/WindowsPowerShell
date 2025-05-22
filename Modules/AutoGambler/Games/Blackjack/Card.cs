
namespace AutoGambler.Games.Blackjack;

public enum Suit { Hearts, Diamonds, Clubs, Spades }
public enum Rank
{
    Two = 2, Three, Four, Five, Six,
    Seven, Eight, Nine, Ten,
    Jack = 10, Queen = 10, King = 10, Ace = 11
}

public class Card(Suit suit, Rank rank)
{
    public Suit Suit { get; } = suit;
    public Rank Rank { get; } = rank;

    public override string ToString() => $"{Rank} of {Suit}";
}
