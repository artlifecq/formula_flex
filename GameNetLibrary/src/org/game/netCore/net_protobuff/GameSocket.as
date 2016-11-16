package org.game.netCore.net_protobuff
{
    import flash.events.Event;
    import flash.net.Socket;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    
    import __AS3__.vec.Vector;

    public class GameSocket extends Socket 
    {

        public static const PACKAGE_MAX:uint = 100000;

        private static var BUFFER_MAX_LENGTH:int = 100000;
        public static var RESULT_ADD:int = 0;
        private static var initNum:uint;
        private static var _lockMsgMap:Dictionary = new Dictionary();
        private static var _unLockMsgMap:Dictionary = new Dictionary();
        private static var _sendMsgTmMap:Dictionary = new Dictionary();

        public var userID:uint = 0;
        public var session:ByteArray;
        public var ip:String;
        public var isPrint:Boolean = true;
        public var printList:Vector.<String>;
        public var blackList:Vector.<String>;
        public var port:int;
        private var _result:uint = 0;
        private var _packageLen:uint = 0;
        private var _dataLen:int = 0;
        private var _needGetData:Boolean = false;
        private var _sendBytes:ByteBuffer;
        private var _easyProtocolOffset:int = 0;
        public var errorFun:Function;
        private var _onlineNum:uint;
        private var outTime:int = 0;

        public function GameSocket()
        {
            _sendBytes = new ByteBuffer();
            objectEncoding = 3;
            endian = "bigEndian";
        }

        private static function encodeData(data:ByteArray):ByteArray
        {
            data.position = 0;
            var newData:ByteArray = new ByteArray();
            while (data.bytesAvailable)
            {
                newData.writeByte(~(data.readByte()));
            }
            newData.position = 0;
            return newData;
        }

        private static function decodeData(data:ByteArray):ByteArray
        {
            var newData:ByteArray = new ByteArray();
            while (data.bytesAvailable)
            {
                newData.writeByte(~(data.readByte()));
            }
            newData.position = 0;
            return newData;
        }


        public function set easyProtocolOffset(value:int):void
        {
            _easyProtocolOffset = value;
        }

        public function addLockUnlockMsg(lockMsgID:String, unLockMsgList:Array=null, autoUnLockGapTm:int=0):void
        {
            _lockMsgMap[lockMsgID] = autoUnLockGapTm;
            if (unLockMsgList && unLockMsgList.length && autoUnLockGapTm > 0)
            {
                for each (var str:String in unLockMsgList)
                {
                    _unLockMsgMap[str] = lockMsgID;
                }
            }
        }

        public function send(moduleID:int, msgID:int, data:ByteArray):void
        {
            var sendTm:int;
            var date:Date = null;
            var time:String;
            var index:int;
            var msgStr:String = moduleID + "_" + msgID;
            var gapTm:int = _lockMsgMap[msgStr];
            var tm:uint = getTimer();
            if (gapTm)
            {
                sendTm = _sendMsgTmMap[msgStr];
                if (sendTm > 0 && (tm - sendTm) < gapTm)
                {
                    return;
                }
                _sendMsgTmMap[msgStr] = tm;
            }
            _sendBytes.position = 4;
            _easyProtocolOffset++;
            _sendBytes.writeVarint32(moduleID);
            _sendBytes.writeVarint32(msgID);
            _sendBytes.writeBytes(data);
            var buffLen:int = _sendBytes.position;
            _sendBytes.position = 3;
            _sendBytes.writeByte(getOffsetByte(_easyProtocolOffset));
            var checkSum:int = getBytesCode(_sendBytes);
            _sendBytes.position = 0;
            _sendBytes.writeShort(buffLen);
            _sendBytes.writeByte(checkSum);
            writeBytes(_sendBytes, 0, _sendBytes.length);
            flush();
            if (isPrint)
            {
                date = new Date();
                time = date.toString() + "  ms : " + date.milliseconds;
                if (printList && printList.length)
                {
                    index = printList.indexOf(msgStr);
                    if (index != -1)
                    {
                        trace(">>Socket[" + ip + ":" + port.toString() + "][msgIDs:" + msgStr + "]", CmdName.getName(msgStr), "[data length:" + _sendBytes.length + "]", "(to Time:" + time + ")");
                    }
                }
                else
                {
                    trace(">>Socket[" + ip + ":" + port.toString() + "][msgIDs:" + msgStr + "]", CmdName.getName(msgStr), "[data length:" + _sendBytes.length + "]", "(to Time:" + time + ")");
                }
            }
            _sendBytes.clear();
        }

        private function getOffsetByte(val:int):int
        {
            var i:int = val;
            i = i ^ (i >> 8);
            i = i ^ (i >> 4);
            i = i & 0xFF;
            return i;
        }

        private function getBytesCode(bytes:ByteArray):int
        {
            var sum:int;
            var i:int = bytes.length - 1;
            while (i >= 0)
            {
                sum = sum + bytes[i];
                i--;
            }
            return sum & 0xFF;
        }

        override public function connect($host:String, $port:int):void
        {
            ip = $host;
            port = $port;
            super.connect(ip, port);
            _result = 0;
            trace("连接SOCKET：：：：", $host, $port);
            _easyProtocolOffset = 0;
            addEvent();
        }

        override public function close():void
        {
            removeEvent();
            if (connected)
            {
                super.close();
            }
            ip = "";
            port = -1;
            _result = 0;
        }

        private function addEvent():void
        {
            addEventListener("socketData", onData);
        }

        private function removeEvent():void
        {
            removeEventListener("socketData", onData);
        }

        private function onData(e:Event):void
        {
//            var msgID = null;
            var receiveBytes:ByteBuffer = null;
            var moduleID:int;
            var cmdID:int;
            var msgStr:String;
            var date:Date = null;
            var time:String;
            var lockMsgID:String;
            outTime = 0;
            while (bytesAvailable > 0)
            {
                if (_packageLen == 0 && bytesAvailable > 2)
                {
                    _packageLen = readUnsignedShort();
                    _dataLen = _packageLen - 2;
                    _needGetData = true;
                }
                if (_needGetData && _dataLen > 0 && bytesAvailable >= _dataLen)
                {
                    receiveBytes = new ByteBuffer();
                    receiveBytes.endian = "bigEndian";
                    readBytes(receiveBytes, 0, _dataLen);
                    moduleID = receiveBytes.readVarint32();
                    cmdID = receiveBytes.readVarint32();
                    msgStr = moduleID + "_" + cmdID;
                    if (isPrint)
                    {
                        if (isNeedPrint(msgStr))
                        {
                            date = new Date();
                            time = date.toString() + "  ms : " + date.milliseconds;
                            trace("<<Socket[" + ip + ":" + port.toString() + "][msgIDs:" + msgStr + "]", CmdName.getName(msgStr), "[data length:" + _packageLen + "]", "(from Time:" + time + ")");
                        }
                    }
                    GameSocketDispatcher.excute(msgStr, receiveBytes);
                    _packageLen = 0;
                    _needGetData = false;
                    lockMsgID = _unLockMsgMap[msgStr];
                    if (lockMsgID)
                    {
                        _sendMsgTmMap[lockMsgID] = 0;
                    }
                }
                if (outTime > 100 || !connected) break;
                outTime++;
            }
        }

        private function isNeedPrint(msgStr:String):Boolean
        {
            if (!isInBlackList(msgStr))
            {
                return true;
            }
            if (isInWhiteList(msgStr))
            {
                return true;
            }
            return false;
        }

        private function isInWhiteList(msgStr:String):Boolean
        {
            var index:int;
            if (printList && printList.length)
            {
                index = printList.indexOf(msgStr);
                if (index != -1)
                {
                    return true;
                }
            }
            return false;
        }

        private function isInBlackList(msgStr:String):Boolean
        {
            var index:int;
            if (blackList && blackList.length)
            {
                index = blackList.indexOf(msgStr);
                if (index != -1)
                {
                    return true;
                }
            }
            return false;
        }
    }
}