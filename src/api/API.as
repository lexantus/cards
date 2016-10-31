package api
{
import flash.external.ExternalInterface;

public class API
{
    private var _changeNewsFunction:Function;

    public function API(changeNewsCallback:Function)
    {
        _changeNewsFunction = changeNewsCallback;
        ExternalInterface.addCallback("getAllNews", getAllNews);
        getAllNews('[{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-10-03T21:00:00.000Z","Year":2016,"Month":10,"YearOnly":false}]');
    }

    private function getAllNews(json:String):void
    {
        _changeNewsFunction(JSON.parse(json));
    }
}
}
