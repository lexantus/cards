package factories
{
import concrete.BannerCard;
import concrete.GalleryCard;
import concrete.TextCard;

import interfaces.ICard;

public class CardFactory
{
    private static const TEXT_CARD:String = "Текст";
    private static const GALLERY_CARD:String = "gallery_card";
    private static const BANNER_CARD:String = "banner_card";

    public function getCard(value:String):ICard
    {
        switch (value)
        {
            case TEXT_CARD:
                return new TextCard();
            case GALLERY_CARD:
                return new GalleryCard();
            case BANNER_CARD:
                return new BannerCard();
            default:
                throw new Error("CardFactory can not create card of type = " + value);
        }
    }
}
}
