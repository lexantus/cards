package concrete
{
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFieldAutoSize;

import interfaces.ICard;

public class Timeline extends Sprite
{
    private var _lines:Vector.<TimeLineItem>;
    private var _y:Number = 0;

    public function Timeline(sortedCards:Vector.<ICard>)
    {
        var n:int = sortedCards.length;
        _lines = new Vector.<TimeLineItem>();

        for (var i:int = 0; i < n; i++)
        {
            drawLine(sortedCards[ i ]);
        }
        y = 50;
        x = 200;
        App.stage.addChild(this);
    }

    private function drawLine(card:ICard):void
    {
        var line:TimeLineItem = new TimeLineItem();
        line.y = _y;
        line.gotoAndStop(2);
        line.active_state.label.autoSize = TextFieldAutoSize.RIGHT;
        line.active_state.label.text = getCardTitle(card);
        line.active_state.label.visible = false;
        line.active_state.redLine.visible = false;
        line.hitAreaSymbol.useHandCursor = true;
        line.hitAreaSymbol.mouseEnabled = true;
        line.hitAreaSymbol.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        line.hitAreaSymbol.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        line.hitAreaSymbol.addEventListener(MouseEvent.CLICK, clickHandler);
        addChild(line);

        _y += 7;
        _lines.push(line);
    }

    private function clickHandler(event:MouseEvent):void
    {
        var line:TimeLineItem = TimeLineItem(event.currentTarget.parent);
        line.active_state.label.visible = true;
        line.active_state.redLine.visible = true;

        var n:int = _lines.length;
        for (var i:int = 0; i < n; i++)
        {
            if (_lines[ i ] != line)
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

    private function getCardTitle(card:ICard):String
    {
        var month:String = card.getMonth();
        return card.getYear() + " " + getMonthRusString(int(month));
    }

    private function getMonthRusString(value:int):String
    {
        var monthes:Vector.<String> = new <String>[ "Январь", "Февраль", "Март", "Апрель", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ];
        return monthes[ value - 1 ];
    }
}
}
