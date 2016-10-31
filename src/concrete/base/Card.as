package concrete.base
{
import interfaces.ICard;

public class Card implements ICard
{
    protected var _type:String;
    protected var _date:String;

    public function Card()
    {
    }

    public function parse(data:Object):void
    {
        _type = data.Type;
        _date = data.Date;
    }
}
}
