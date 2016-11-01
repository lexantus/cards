package concrete
{
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class CardRenderer extends Sprite
{
    private var bg:CardPanel;

    public function CardRenderer()
    {
        bg = new CardPanel();
        bg.header.header_mc.gotoAndStop(2);
        bg.header.title.text = "Hello world";
        addChild(bg);

        addEventListener(MouseEvent.MOUSE_OVER, cardViewMouseOverHandler);
        addEventListener(MouseEvent.MOUSE_OUT, cardViewMouseOutHandler);
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
