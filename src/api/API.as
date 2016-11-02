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
        var news:String = '[' + '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-10-03T21:00:00.000Z","Year":2016,"Month":10,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-11-03T21:00:00.000Z","Year":2016,"Month":11,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-12-03T21:00:00.000Z","Year":2016,"Month":12,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2017-01-03T21:00:00.000Z","Year":2017,"Month":01,"YearOnly":false}' + ']';
        getAllNews(news);
    }

    private function getAllNews(json:String):void
    {
        _changeNewsFunction(JSON.parse(json));
    }
}
}
