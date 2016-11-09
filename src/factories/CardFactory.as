package factories
{
import concrete.BannerCard;
import concrete.GalleryCard;
import concrete.NoDataCard;
import concrete.TextCard;

import interfaces.ICard;

public class CardFactory
{
    public static const TEXT_CARD:String = "Текст";
    public static const GALLERY_CARD:String = "gallery_card";
    public static const BANNER_CARD:String = "banner_card";
    public static const NO_DATA_CARD:String = "no_data_card";

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
            case NO_DATA_CARD:
                return new NoDataCard();
            default:
                throw new Error("CardFactory can not create card of type = " + value);
        }
    }
}
}
