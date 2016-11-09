package api
{
public class API
{
    private var _changeNewsFunction:Function;

    public function API(changeNewsCallback:Function)
    {
        _changeNewsFunction = changeNewsCallback;
        //ExternalInterface.addCallback("getAllNews", getAllNews);
        var news:String = '[' + '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-01-03T21:00:00.000Z","Year":2016,"Month":1,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-09-03T21:00:00.000Z","Year":2016,"Month":9,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2016-12-03T21:00:00.000Z","Year":2016,"Month":12,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2017-01-03T21:00:00.000Z","Year":2017,"Month":1,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2017-12-03T21:00:00.000Z","Year":2017,"Month":12,"YearOnly":false}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2027-01-03T21:00:00.000Z","Year":2027,"Month":1,"YearOnly":true}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2028-01-03T21:00:00.000Z","Year":2028,"Month":1,"YearOnly":true}' + "," +
                '{"Type":"Текст","Title":"rich text test","Text":"Some text missing","Date":"2038-01-03T21:00:00.000Z","Year":2038,"Month":1,"YearOnly":false}' + ']';
        getAllNews(news);
    }

    private function getAllNews(json:String):void
    {
        _changeNewsFunction(JSON.parse(json));
    }
}
}
