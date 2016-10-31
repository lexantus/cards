package
{
import api.API;

import concrete.Deck;

import factories.CardFactory;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;

import interfaces.ICard;

[SWF(width="640", height="578", frameRate="60", backgroundColor="#cccccc")]
public class App extends Sprite
{
    public static var stage:Stage;

    private var _cardFactory:CardFactory;
    private var _cards:Vector.<ICard>;
    private var _deck:Deck;

    public function App()
    {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void
    {
        App.stage = stage;
        _cardFactory = new CardFactory();
        new API(getNews);
    }

    private function getNews(json:Object):void
    {
        _cards = new Vector.<ICard>();

        var card:ICard;
        for each (var obj:Object in json)
        {
            card = _cardFactory.getCard(obj.Type);
            card.parse(obj);
            _cards.push(card);
        }

        _deck = new Deck(_cards, 250);
    }
}
}
