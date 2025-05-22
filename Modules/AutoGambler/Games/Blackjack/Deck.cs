namespace AutoGambler.Games.Blackjack;

public class Deck
{
    private readonly List<Card> _cards;
    private readonly Random _rng = new();

    public Deck()
    {
        _cards = [];
        foreach (Suit suit in Enum.GetValues(typeof(Suit)))
        {
            foreach (Rank rank in Enum.GetValues(typeof(Rank)))
            {
                if ((int)rank <= 11) // Prevent double face cards due to enum values
                    _cards.Add(new Card(suit, rank));
            }
        }
    }

    public void Shuffle()
    {
        for (int i = _cards.Count - 1; i > 0; i--)
        {
            int j = _rng.Next(i + 1);
            (_cards[i], _cards[j]) = (_cards[j], _cards[i]);
        }
    }

    public Card Draw()
    {
        if (_cards.Count == 0)
            throw new InvalidOperationException("Deck is empty.");
        var card = _cards[0];
        _cards.RemoveAt(0);
        return card;
    }
}
