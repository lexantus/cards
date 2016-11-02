package interfaces
{
public interface ICard
{
    function parse(data:Object):void;
    function getDate():String;
    function getYear():String;
    function getMonth():String;
    function getYearOnly():Boolean;
}
}
