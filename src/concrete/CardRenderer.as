package concrete
{
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import interfaces.ICard;

public class CardRenderer extends Sprite
{
    private var bg:CardPanel;
    private var card:ICard;

    public function CardRenderer(card:ICard)
    {
        this.card = card;
        bg = new CardPanel();
        bg.header.title.text = card.getCardTitle();
        addChild(bg);

        addEventListener(MouseEvent.MOUSE_OVER, cardViewMouseOverHandler);
        addEventListener(MouseEvent.MOUSE_OUT, cardViewMouseOutHandler);
    }

    public function update(card:ICard):void
    {
        this.card = card;
        bg.header.title.text = card.getCardTitle();
    }

    private function cardViewMouseOverHandler(event:Event):void
    {
        TweenLite.to(bg, 0.2, {y: -5});
    }

    private function cardViewMouseOutHandler(event:Event):void
    {
        TweenLite.to(bg, 0.2, {y: 5});
    }
}
}
