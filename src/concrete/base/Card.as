package concrete.base
{
import interfaces.ICard;

public class Card implements ICard
{
    protected var _type:String;
    protected var _date:String;
    protected var _year:String;
    protected var _month:String;
    protected var _yearOnly:Boolean;

    public function Card()
    {
    }

    public function parse(data:Object):void
    {
        _type = data.Type;
        _date = data.Date;
        _year = data.Year;
        _yearOnly = data.YearOnly;
        _month = data.Month;
    }

    public function getDate():String
    {
        return _date;
    }

    public function getYear():String
    {
        return _year;
    }

    public function getMonth():String
    {
        return _month;
    }

    public function getYearOnly():Boolean
    {
        return _yearOnly;
    }

    public function getMonthRusString(value:int):String
    {
        var monthes:Vector.<String> = new <String>[ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ];
        return monthes[ value - 1 ];
    }

    public function getCardTitle():String
    {
        var month:String = getMonth();
        if (getYearOnly())
            return getYear();
        else
            return getYear() + " " + getMonthRusString(int(month));
    }

    public function setMonth(month:String):void
    {
        _month = month;
    }

    public function setYear(year:String):void
    {
        _year = year;
    }

    public function setYearOnly(value:Boolean):void
    {
        _yearOnly = value;
    }
}
}
