package concrete
{
import com.greensock.TweenLite;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class CardRenderer extends Sprite
{
    private var bg:Shape;

    public function CardRenderer()
    {
        bg = new Shape();
        bg.graphics.lineStyle(2);
        bg.graphics.beginFill(0xff0000);
        bg.graphics.drawRect(0, 0, 556, 364);
        bg.graphics.endFill();
        addChild(bg);

        addEventListener(MouseEvent.MOUSE_OVER, cardViewMouseOverHandler);
        addEventListener(MouseEvent.MOUSE_OUT, cardViewMouseOutHandler);
    }

    private function cardViewMouseOverHandler(event:Event):void
    {
        TweenLite.to(bg, 0.2, {y: - 5});
    }

    private function cardViewMouseOutHandler(event:Event):void
    {
        TweenLite.to(bg, 0.2, {y: 5});
    }
}
}
