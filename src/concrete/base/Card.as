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
}
}
