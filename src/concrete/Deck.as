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

    public function Deck(cards:Vector.<ICard>, positionY:Number)
    {
        _cardViews = new Vector.<CardRenderer>(cards.length, true);

        var n:int = cards.length;
        for (var i:int = 0; i < n; i++)
        {
            _cardViews[ i ] = new CardRenderer(cards[ i ]);
            _cardViews[ i ].y = (i - MAX_VISIBLE_CARDS) * DELTA_Y + positionY;
            _cardViews[ i ].z = (MAX_VISIBLE_CARDS - i) * DELTA_Z;
            addChild(_cardViews[ i ]);
        }
        x = -20;
        y = -50;
        App.stage.addChild(this);
    }
}
}
