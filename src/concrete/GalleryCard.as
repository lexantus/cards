package concrete
{
import concrete.base.Card;

public class GalleryCard extends Card
{
    protected var _title:String;
    protected var _images:Array;
    protected var _text:String;

    public function GalleryCard()
    {
        super();
    }

    override public function parse(data:Object):void
    {
        super.parse(data);
        _title = data.Title;
        _images = data.Images;
        _text = data.Text;
    }
}
}
