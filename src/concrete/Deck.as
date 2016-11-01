package concrete
{
import interfaces.ICard;

public class Deck
{
    private static const MAX_VISIBLE_CARDS:int = 5;
    private static const DELTA_Y:Number = 50;
    private static const DELTA_Z:Number = 64;

    private var _cardViews:Vector.<CardRenderer>;

    public function Deck(cards:Vector.<ICard>, positionY:Number)
    {
        _cardViews = new Vector.<CardRenderer>(MAX_VISIBLE_CARDS, true);

        for (var i:int = 0; i < MAX_VISIBLE_CARDS; i++)
        {
            _cardViews[ i ] = new CardRenderer();
            _cardViews[ i ].y = (i - MAX_VISIBLE_CARDS) * DELTA_Y + positionY;
            _cardViews[ i ].z = (MAX_VISIBLE_CARDS - i) * DELTA_Z;
            App.stage.addChild(_cardViews[ i ]);
        }
    }
}
}
