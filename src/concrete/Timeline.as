package concrete
{
import concrete.base.Card;

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
                drawYear(cards[ i ]);
            }
        }

        x = 640;
        y = 65;
        App.stage.addChild(this);
    }

    private function drawYear(card:ICard):void
    {
        drawYearLine(int(card.getYear()), card.getYearOnly());

        if (card.getYearOnly())
            return;

        for (var i:int = 0; i < 12; i++)
        {
            var matchCard:ICard = findCard(i + 1, int(card.getYear()));
            if (matchCard)
                drawLine(matchCard);
            else
                drawEmptyLine();
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

    private function findFirstCardWithData(year:int):ICard
    {
        var n:int = _cards.length;
        for (var i:int = 0; i < n; i++)
        {
            if (int(_cards[ i ].getYear()) == year)
                return _cards[ i ];
        }
        return null;
    }

    private function findTimeLineItem(card:ICard):TimeLineItem
    {
        var n:int = _lines.length;
        for (var i:int = 0; i < n; i++)
        {
            if (_lines[ i ].data == card)
                return _lines[ i ];
        }
        return null;
    }

    private function drawLine(card:ICard):void
    {
        createLine(card);
    }

    private function drawEmptyLine():void
    {
        var line:TimeLineItem = new TimeLineItem();
        line.y = _y;
        addChild(line);

        _y += STEP_Y;
    }

    private function drawYearLine(year:int, isYearOnly:Boolean):void
    {
        var card:ICard = new Card();
        card.setYear(String(year));
        card.setYearOnly(isYearOnly);
        createLine(card, true);
    }

    private function createLine(card:ICard, isYear:Boolean = false):void
    {
        var line:TimeLineItem = new TimeLineItem();
        line.y = _y;
        line.gotoAndStop(2);
        line.hitAreaSymbol.useHandCursor = true;
        line.hitAreaSymbol.mouseEnabled = true;

        initLine(line, card);

        if (isYear)
        {
            line.active_state.gotoAndStop(30);
            line.active_state.label.text = card.getYear();
            line.hitAreaSymbol.addEventListener(MouseEvent.CLICK, clickYearHandler);
        }
        else
        {
            line.active_state.label.text = card.getCardTitle();
            line.hitAreaSymbol.addEventListener(MouseEvent.CLICK, clickHandler);
            line.hitAreaSymbol.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
            line.hitAreaSymbol.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        }

        addChild(line);

        _y += STEP_Y;
        _lines.push(line);
    }

    private function initLine(line:TimeLineItem, card:ICard):void
    {
        line.data = card;
        line.active_state.label.autoSize = TextFieldAutoSize.RIGHT;
        line.active_state.label.visible = false;
        line.active_state.redLine.visible = false;
    }

    private function clickYearHandler(event:MouseEvent):void
    {
        var line:TimeLineItem = TimeLineItem(event.currentTarget.parent);

        var card:ICard = ICard(line.data);
        if (card.getYearOnly())
        {
            resetActiveStates(line);
            line.active_state.label.visible = true;
            line.active_state.redLine.visible = true;
        }
        else
        {
            var cardInYearWithData:ICard = findFirstCardWithData(int(card.getYear()));
            var lineInYearWithData:TimeLineItem = findTimeLineItem(cardInYearWithData);
            resetActiveStates(lineInYearWithData);
            lineInYearWithData.active_state.label.visible = true;
            lineInYearWithData.active_state.redLine.visible = true;
        }
    }

    private function clickHandler(event:MouseEvent):void
    {
        var line:TimeLineItem = TimeLineItem(event.currentTarget.parent);
        line.active_state.label.visible = true;
        line.active_state.redLine.visible = true;

        resetActiveStates(line);
    }

    private function resetActiveStates(line:TimeLineItem):void
    {
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
