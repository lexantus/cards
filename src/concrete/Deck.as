package concrete
{
import com.greensock.TweenNano;

import concrete.base.Card;

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

    private var _currentCardIndex:uint;
    private var _swapRenderer:CardRenderer;

    public function Deck(cards:Vector.<ICard>, positionY:Number)
    {
        _cards = cards;
        _positionY = positionY;

        _cardViews = new Vector.<CardRenderer>(cards.length, true);
        update(cards[ _cards.length - 1 ]);
        next(5);
        x = -15;
        y = -50;
        App.stage.addChild(this);
    }

    public function next(duration:Number):void
    {
        TweenNano.to(_swapRenderer, duration, {y: _cardViews[ 0 ].y, z: _cardViews[ 0 ].z, alpha: 1});

        var n:int = _currentCardIndex + 1 < MAX_VISIBLE_CARDS ? _currentCardIndex + 1 : MAX_VISIBLE_CARDS;
        _swapRenderer.update(_cards[ _currentCardIndex - n ]);
        for (var i:int = 0; i < n - 1; i++)
        {
            TweenNano.to(_cardViews[ i ], duration, {y: "+=" + DELTA_Y, z: "-=" + DELTA_Z});
        }

        TweenNano.to(_cardViews[ n - 1 ], duration,
                     {y: "+=" + DELTA_Y, z: "-=" + DELTA_Z, alpha: 0, onComplete: completeNext});
    }

    private function completeNext():void
    {

    }

    public function update(card:ICard):void
    {
        _swapRenderer = new CardRenderer(new Card());
        _swapRenderer.alpha = 0;
        addChild(_swapRenderer);

        _currentCardIndex = getCardIndex(card);
        _cardViews = new Vector.<CardRenderer>(_cards.length, true);

        var n:int = _currentCardIndex + 1 < MAX_VISIBLE_CARDS ? _currentCardIndex + 1 : MAX_VISIBLE_CARDS;
        for (var i:int = 0; i < n; i++)
        {
            _cardViews[ i ] = new CardRenderer(_cards[ _currentCardIndex + 1 - (n - i) ]);
            _cardViews[ i ].y = (i - n) * DELTA_Y + _positionY;
            _cardViews[ i ].z = (n - i) * DELTA_Z;
            addChild(_cardViews[ i ]);
        }

        _swapRenderer.y = _cardViews[ 0 ].y - DELTA_Y;
        _swapRenderer.z = _cardViews[ 0 ].z + DELTA_Z;
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
