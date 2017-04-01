package org.game.netCore.net_protobuff
{
    import flash.utils.Dictionary;

    public class CmdName 
    {

        private static var _list:Dictionary = new Dictionary();


        public static function addName(cmdID:String, name:String):void
        {
            _list[cmdID] = name;
        }

        public static function getName(id:String):String
        {
            var str:String = _list[id];
            if (str)
            {
                return str;
            }
            return "---";
        }
    }
}