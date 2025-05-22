namespace AutoGambler.Games.Blackjack;

public class Hand
{
    public List<Card> Cards { get; } = [];

    public void AddCard(Card card) => Cards.Add(card);

    public int TotalValue
    {
        get
        {
            int total = Cards.Sum(c => (int)c.Rank);
            int aces = Cards.Count(c => c.Rank == Rank.Ace);

            while (total > 21 && aces > 0)
            {
                total -= 10;
                aces--;
            }

            return total;
        }
    }

    public bool IsBlackjack => Cards.Count == 2 && TotalValue == 21;
    public bool IsBust => TotalValue > 21;

    public override string ToString() => string.Join(", ", Cards.Select(c => c.ToString()));
}
