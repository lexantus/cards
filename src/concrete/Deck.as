package concrete
{
import flash.display.Sprite;

import interfaces.ICard;

public class Deck extends Sprite
{
    private static const MAX_VISIBLE_CARDS:int = 5;
    private static const DELTA_Y:Number = 50;
    private static const DELTA_Z:Number = 64;

    private var _cardViews:Vector.<CardRenderer>;
    private var _cards:Vector.<ICard>;
    private var _positionY:Number;

    public function Deck(cards:Vector.<ICard>, positionY:Number)
    {
        _cards = cards;
        _positionY = positionY;

        _cardViews = new Vector.<CardRenderer>(cards.length, true);
        update(cards[ 0 ]);
        x = -15;
        y = -50;
        App.stage.addChild(this);
    }

    public function update(card:ICard):void
    {
        var currentCardIndex:uint = getCardIndex(card);
        _cardViews = new Vector.<CardRenderer>(_cards.length, true);

        var n:int = currentCardIndex + 1 < MAX_VISIBLE_CARDS ? currentCardIndex + 1 : MAX_VISIBLE_CARDS;
        for (var i:int = 0; i < n; i++)
        {
            _cardViews[ i ] = new CardRenderer(_cards[ currentCardIndex + 1 - (n - i) ]);
            _cardViews[ i ].y = (i - n) * DELTA_Y + _positionY;
            _cardViews[ i ].z = (n - i) * DELTA_Z;
            addChild(_cardViews[ i ]);
        }
    }

    private function getCardIndex(card:ICard):uint
    {
        var n:int = _cards.length;
        for (var i:int = 0; i < n; i++)
        {
            if (_cards[ i ] == card)
                return i;
        }
        throw new Error("There is no card with title = " + card.getCardTitle());
    }
}
}
