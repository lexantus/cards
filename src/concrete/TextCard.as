package concrete
{
import concrete.base.Card;

public class TextCard extends Card
{
    protected var _title:String;
    protected var _text:String;
    protected var _images:Array;
    protected var _link:String;

    public function TextCard()
    {
        super();
    }

    override public function parse(data:Object):void
    {
        super.parse(data);
        _title = data.Title;
        _text = data.Text;
        _images = data.Images;
        _link = data.Link;
    }
}
}
