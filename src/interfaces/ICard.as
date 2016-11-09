package interfaces
{
public interface ICard
{
    function parse(data:Object):void;

    function getDate():String;

    function getYear():String;

    function getMonth():String;

    function getYearOnly():Boolean;

    function getMonthRusString(value:int):String;

    function getCardTitle():String;

    function setMonth(month:String):void;

    function setYear(year:String):void;

    function setYearOnly(value:Boolean):void;
}
}
