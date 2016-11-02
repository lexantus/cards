package concrete
{
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import interfaces.ICard;

public class Timeline extends Sprite
{
    private const LINE_THICKNESS:Number = 20;
    private const PADDING_X:Number = 10;

    private const LONG_LINE_WIDTH:Number = 150;
    private const LONG_OVER_LINE_WIDTH:Number = 175;

    private const SHORT_LINE_WIDTH:Number = 20;
    private const SHORT_OVER_LINE_WIDTH:Number = 30;

    private var _hitAreas:Vector.<Sprite>;
    private var _lines:Vector.<Sprite>;

    private var _y:Number = 0;

    public function Timeline(sortedCards:Vector.<ICard>)
    {
        var n:int = sortedCards.length;
        _lines = new Vector.<Sprite>(n, true);
        _hitAreas = new Vector.<Sprite>(n, true);

        for (var i:int = 0; i < n; i++)
        {
            drawYear(sortedCards[ i ]);
        }
        y = 200;
        x = 0;
        App.stage.addChild(this);
    }

    private function drawYear(card:ICard):void
    {
        var tf:TextField = new TextField();
        tf.autoSize = TextFieldAutoSize.RIGHT;
        tf.text = getCardTitle(card);

        var hitArea:Sprite = new Sprite();
        hitArea.graphics.beginFill(0xff0000, 0.1);
        hitArea.graphics.drawRect(0, 0, LONG_OVER_LINE_WIDTH, LINE_THICKNESS);
        hitArea.graphics.endFill();
        hitArea.addEventListener(MouseEvent.MOUSE_OVER, longLineMouseOverHandler);
        hitArea.addEventListener(MouseEvent.MOUSE_OUT, longLineMouseOutHandler);
        addChild(hitArea);

        var longLine:Sprite = new Sprite();
        longLine.graphics.lineStyle(3, 0xffff00);
        longLine.graphics.moveTo(0, 0);
        longLine.graphics.lineTo(LONG_LINE_WIDTH, 0);
        hitArea.addChild(longLine);

        tf.x = 0;
        tf.y = -tf.height / 2;
        longLine.addChild(tf);

        _hitAreas[ _hitAreas.length - 1 ] = hitArea;
        _lines[ _lines.length - 1 ] = longLine;
    }

    private function getCardTitle(card:ICard):String
    {
        return card.getYear() + " " + card.getMonth();
    }

    private function longLineMouseOverHandler(event:MouseEvent):void
    {
        /*        var hitArea:DisplayObjectContainer = DisplayObjectContainer(event.currentTarget);
         hitArea.width = LONG_OVER_LINE_WIDTH;

         var longLine:Sprite = Sprite(hitArea.getChildByName("longLine"));
         longLine.graphics.clear();
         longLine.graphics.lineStyle(3, 0xffff00, 1, false, "normal", CapsStyle.ROUND);
         longLine.graphics.moveTo(LONG_OVER_LINE_WIDTH, hitArea.height / 2);
         longLine.graphics.lineTo(0, hitArea.height / 2);

         var tf:TextField = TextField(hitArea.getChildByName("tf"));
         tf.y -= LONG_OVER_LINE_WIDTH - LONG_LINE_WIDTH;*/
    }

    private function longLineMouseOutHandler(event:MouseEvent):void
    {

    }

    private function drawMonthYear():void
    {

    }
}
}
