package org.game.netCore.connection
{
    import org.game.netCore.net_protobuff.GameSocket;
    import __AS3__.vec.Vector;
    import org.game.netCore.net_protobuff.GameSocketDispatcher;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import org.game.netCore.net_protobuff.ByteBuffer;

    public class SocketConnection_protoBuffer 
    {

        private static var _mainSocket:GameSocket;


        public static function get mainSocket():GameSocket
        {
            if (_mainSocket == null)
            {
                _mainSocket = new GameSocket();
            }
            return _mainSocket;
        }

        public static function set print(b:Boolean):void
        {
            mainSocket.isPrint = b;
        }

        public static function get print():Boolean
        {
            return mainSocket.isPrint;
        }

        public static function set printList(list:Vector.<String>):void
        {
            mainSocket.printList = list;
        }

        public static function get printList():Vector.<String>
        {
            return mainSocket.printList;
        }

        public static function set blackList(list:Vector.<String>):void
        {
            mainSocket.blackList = list;
        }

        public static function get blackList():Vector.<String>
        {
            return mainSocket.blackList;
        }

        public static function addCmdListener(id:String, listener:Function):void
        {
            GameSocketDispatcher.addListener(id, listener);
        }

        public static function removeCmdListener(id:String, listener:Function):void
        {
            GameSocketDispatcher.removeListener(id, listener);
        }

        public static function dispatchCmd(type:String, event:Event):void
        {
            GameSocketDispatcher.excute(type, event);
        }

        public static function hasCmdListener(id:String):Boolean
        {
            return GameSocketDispatcher.hasListener(id);
        }

        public static function willTriggerCmd(id:String, listener:Function):Boolean
        {
            return GameSocketDispatcher.willTrigger(id, listener);
        }

        private static function getCmdID(id:uint):String
        {
            return id.toString();
        }

        public static function addGapSendMsg(msg:String, gapTm:int, ... arg):void
        {
            mainSocket.addLockUnlockMsg(msg, arg, gapTm);
        }

        public static function send(cmdID:String, byte:ByteArray=null):void
        {
            var socket:GameSocket = mainSocket;
            if (!socket.connected)
            {
                socket.dispatchEvent(new Event("close"));
                return;
            }
            var arr:Array = cmdID.split("_");
            var moduleID:uint = arr[0];
            var cmdId:uint = arr[1];
            byte = byte || new ByteArray();
            socket.send(moduleID, cmdId, byte);
        }

        public static function messsageUnCompress(orgBytes:ByteBuffer, msgIDs:String):ByteBuffer
        {
            var buffer:ByteBuffer = new ByteBuffer();
            try
            {
                orgBytes.readBytes(buffer, 0, (orgBytes.length - orgBytes.position));
                buffer.uncompress();
            }
            catch(e:Error)
            {
                trace(msgIDs + "解压字节流出错了", e.toString(), e.getStackTrace());
                throw e;
            }
            return buffer;
        }

        public static function excuteAll():void
        {
            trace("///////////////////////////////////////执行所有协议///////////////////////////////////////");
        }
    }
}