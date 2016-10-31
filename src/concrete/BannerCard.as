package concrete
{
import concrete.base.Card;

public class BannerCard extends Card
{
    protected var _title:String;
    protected var _image:String;
    protected var _link:String;

    public function BannerCard()
    {
        super();
    }

    override public function parse(data:Object):void
    {
        super.parse(data);
        _title = data.Title;
        _image = data.Images[ 0 ];
        _link = data.Link;
    }
}
}
