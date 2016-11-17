package org.game.netCore.net_protobuff
{
    public class CmdInfo 
    {
        public var type:String;
        public var excuteFun:Function;
        public var data:Object;

        public function CmdInfo($type:String, $excuteFun:Function, $data:Object=null)
        {
            type = $type;
            excuteFun = $excuteFun;
            data = $data;
        }
    }
}