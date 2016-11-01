package concrete
{
import flash.display.CapsStyle;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import interfaces.ICard;

public class Timeline extends Sprite
{
    private const DELTA_POSITION_Y:Number = 5;
    private const PADDING_X:Number = 5;

    private const LONG_LINE_WIDTH:Number = 35;
    private const LONG_OVER_LINE_WIDTH:Number = 45;

    private const SHORT_LINE_WIDTH:Number = 20;
    private const SHORT_OVER_LINE_WIDTH:Number = 30;

    private var _hitAreas:Vector.<Sprite>;
    private var _lines:Vector.<Sprite>;
    private var _titles:Vector.<String>;

    private var _y:Number = 0;

    public function Timeline(sortedCards:Vector.<ICard>)
    {
        var n:int = sortedCards.length;
        _lines = new Vector.<Sprite>(n, true);
        _titles = new Vector.<String>(n, true);

        for (var i:int = 0; i < n; i++)
        {
            drawYear(sortedCards[ i ].getDate());
        }
    }

    private function drawYear(date:String):void
    {
        var tf:TextField = new TextField();
        tf.text = date;

        var hitArea:Sprite = new Sprite();
        hitArea.graphics.beginFill(0xff0000, 0.1);
        hitArea.graphics.drawRect(0, -DELTA_POSITION_Y / 2, LONG_OVER_LINE_WIDTH, DELTA_POSITION_Y);
        hitArea.graphics.endFill();
        hitArea.addEventListener(MouseEvent.MOUSE_OVER, longLineMouseOverHandler);
        hitArea.addEventListener(MouseEvent.MOUSE_OUT, longLineMouseOutHandler);
        addChild(hitArea);

        var longLine:Sprite = new Sprite();
        longLine.graphics.lineStyle(3, 0xffff00, 1, false, "normal", CapsStyle.ROUND);
        longLine.graphics.moveTo(0, _y);
        longLine.graphics.lineTo(-LONG_LINE_WIDTH, _y * DELTA_POSITION_Y * _lines.length);
        hitArea.addChild(longLine);

        tf.x -= longLine.width - PADDING_X;
        longLine.addChild(tf);

        _hitAreas[ _hitAreas.length - 1 ] = hitArea;
        _lines[ _lines.length - 1 ] = longLine;
        _titles[ _titles.length - 1 ] = date;
    }

    private function longLineMouseOverHandler(event:MouseEvent):void
    {
        var hitArea:DisplayObjectContainer = DisplayObjectContainer(event.currentTarget);
        hitArea.width = LONG_OVER_LINE_WIDTH;

        var longLine:Sprite = Sprite(hitArea.getChildByName("longLine"));
        longLine.graphics.clear();
        longLine.graphics.lineStyle(3, 0xffff00, 1, false, "normal", CapsStyle.ROUND);
        longLine.graphics.moveTo(LONG_OVER_LINE_WIDTH, hitArea.height / 2);
        longLine.graphics.lineTo(0, hitArea.height / 2);

        var tf:TextField = TextField(hitArea.getChildByName("tf"));
        tf.y -= LONG_OVER_LINE_WIDTH - LONG_LINE_WIDTH;
    }

    private function longLineMouseOutHandler(event:MouseEvent):void
    {

    }

    private function drawMonthYear():void
    {

    }
}
}
