package concrete
{
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFieldAutoSize;

import interfaces.ICard;

public class Timeline extends Sprite
{
    private static const STEP_Y:int = 7;
    private var _lines:Vector.<TimeLineItem>;
    private var _y:Number = 0;
    private var _cards:Vector.<ICard>;

    public function Timeline(cards:Vector.<ICard>)
    {
        _cards = cards;
        var n:int = cards.length;
        _lines = new Vector.<TimeLineItem>();

        var currentYear:String = "";

        for (var i:int = 0; i < n; i++)
        {
            if (currentYear != cards[ i ].getYear())
            {
                currentYear = cards[ i ].getYear();
                drawYear(int(currentYear));
            }
        }

        /*        var minYear:int = int(cards[ 0 ].getYear());
         var maxYear:int = int(cards[ cards.length - 1 ].getYear());

         for (var i:int = 0; i < (maxYear - minYear + 1) * 13; i++)
         {
         if (i % 13 == 0)
         {
         drawYearLine();
         }
         else
         {
         drawLine(findCard((i + 2) % 15, minYear + int(i / 13)));
         }
         }*/
        x = 640;
        y = 65;
        App.stage.addChild(this);
    }

    private function drawYear(year:int):void
    {
        drawYearLine();
        for (var i:int = 0; i < 12; i++)
        {
            drawLine(findCard(i + 1, year));
        }
    }

    private function findCard(month:int, year:int):ICard
    {
        var n:int = _cards.length;
        for (var i:int = 0; i < n; i++)
        {
            if (int(_cards[ i ].getMonth()) == month && int(_cards[ i ].getYear()) == year)
                return _cards[ i ];
        }
        return null;
    }

    private function drawLine(card:ICard = null):void
    {
        var line:TimeLineItem = new TimeLineItem();
        line.y = _y;
        if (card)
        {
            line.gotoAndStop(2);
            line.active_state.label.text = card.getCardTitle();
            line.active_state.label.autoSize = TextFieldAutoSize.RIGHT;
            line.active_state.label.visible = false;
            line.active_state.redLine.visible = false;
            line.hitAreaSymbol.useHandCursor = true;
            line.hitAreaSymbol.mouseEnabled = true;
            line.hitAreaSymbol.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
            line.hitAreaSymbol.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
            line.hitAreaSymbol.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        addChild(line);

        _y += STEP_Y;
        _lines.push(line);
    }

    private function drawYearLine():void
    {
        _y += STEP_Y;
    }

    private function clickHandler(event:MouseEvent):void
    {
        var line:TimeLineItem = TimeLineItem(event.currentTarget.parent);
        line.active_state.label.visible = true;
        line.active_state.redLine.visible = true;

        var n:int = _lines.length;
        for (var i:int = 0; i < n; i++)
        {
            if (_lines[ i ] != line && _lines[ i ].active_state)
            {
                _lines[ i ].active_state.label.visible = false;
                _lines[ i ].active_state.redLine.visible = false;
            }
        }
    }

    private function mouseOverHandler(event:MouseEvent):void
    {
        var line:TimeLineItem = TimeLineItem(event.currentTarget.parent);
        line.active_state.play();
    }

    private function mouseOutHandler(event:MouseEvent):void
    {
        var line:TimeLineItem = TimeLineItem(event.currentTarget.parent);
        line.active_state.gotoAndStop(1);
    }
}
}
