namespace AutoGambler.Games.Blackjack;

public class BlackjackGame
{
    public Deck Deck { get; private set; }
    public Hand PlayerHand { get; private set; }
    public Hand DealerHand { get; private set; }

    public void StartNewGame()
    {
        Deck = new Deck();
        Deck.Shuffle();

        PlayerHand = new Hand();
        DealerHand = new Hand();

        PlayerHand.AddCard(Deck.Draw());
        DealerHand.AddCard(Deck.Draw());
        PlayerHand.AddCard(Deck.Draw());
        DealerHand.AddCard(Deck.Draw());
    }

    public void PlayerHit() => PlayerHand.AddCard(Deck.Draw());
    public void DealerTurn()
    {
        while (DealerHand.TotalValue < 17)
            DealerHand.AddCard(Deck.Draw());
    }

    public string DetermineOutcome()
    {
        if (PlayerHand.IsBust) return "Loss";
        if (DealerHand.IsBust) return "Win";
        if (PlayerHand.TotalValue > DealerHand.TotalValue) return "Win";
        if (PlayerHand.TotalValue < DealerHand.TotalValue) return "Loss";
        return "Push";
    }
}
