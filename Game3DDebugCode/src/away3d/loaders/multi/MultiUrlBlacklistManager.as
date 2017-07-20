package away3d.loaders.multi
{
    import flash.events.IOErrorEvent;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    
    import away3d.tick.Tick;

    public class MultiUrlBlacklistManager 
    {

        private static const listDict:Dictionary = new Dictionary();
        private static const PROCESS_LIMIT:int = 3;

        public static var REPEAT_LIMIT:int = 3;
        public static var TICK_LIMIT:int = 600000;
        private static var running:Boolean = false;

        public function MultiUrlBlacklistManager()
        {
            throw new Error("has no instance!");
        }

        private static function process(deltaTime:int):void
        {
            var node:BlacklistNode = null;
            var task:MultiLoadData = null;
            var key:String = "";
            var costTime:uint;
            var timestamp:uint;
            var eventError:IOErrorEvent;
            for (key in listDict)
            {
                eventError = null;
                node = (listDict[key] as BlacklistNode);
                task = node.shift();
                if (task == null)
                {
                    delete listDict[key];
                }
                else
                {
                    while (task)
                    {
                        timestamp = getTimer();
                        if (task.onError != null && eventError == null)
                        {
                            eventError = new IOErrorEvent("ioError", false, false, "");
                        }
                        if (task.onError != null)
                        {
                            eventError.text = ("load fail after retry more than three times :" + task.reqUrl);
                            task.onError(task, eventError);
                        }
                        costTime = costTime + getTimer() - timestamp;
                        if (costTime >= 3)
                        {
                            return;
                        }
                        task = node.shift();
                    }
                }
            }
            stop();
        }

        private static function start():void
        {
            if (running)
            {
                return;
            }
            running = true;
            Tick.instance.addCallBack(process);
        }

        private static function stop():void
        {
            if (running)
            {
                Tick.instance.removeCallBack(process);
                running = false;
            }
        }

        public static function register(url:String):void
        {
            if (listDict[url] == null)
            {
                listDict[url] = new BlacklistNode(url);
            }
            var node:BlacklistNode = (listDict[url] as BlacklistNode);
            node.register();
        }

        public static function add(task:MultiLoadData):Boolean
        {
            if (!check(task.url))
            {
                return false;
            }
            var node:BlacklistNode = (listDict[task.url] as BlacklistNode);
            node.add(task);
            start();
            return true;
        }

        public static function check(url:String):Boolean
        {
            var node:BlacklistNode = (listDict[url] as BlacklistNode);
            if (node == null)
            {
                return false;
            }
            if ((getTimer() - node.timestamp) < TICK_LIMIT)
            {
                return true;
            }
            if (node.repeat < REPEAT_LIMIT)
            {
                return false;
            }
            return true;
        }
    }
}

import away3d.utils.GCObject;
import __AS3__.vec.Vector;
import away3d.loaders.multi.MultiLoadData;
import flash.utils.getTimer;

class BlacklistNode extends GCObject 
{

    private var _url:String;
    private var _list:Vector.<MultiLoadData>;
    private var _repeat:int;
    private var _timestamp:uint = 0;

    public function BlacklistNode(url:String)
    {
        _url = url;
        _list = new Vector.<MultiLoadData>();
        _repeat = 0;
        _timestamp = getTimer();
    }

    public function register():void
    {
        _repeat++;
        _timestamp = getTimer();
    }

    public function add(task:MultiLoadData):void
    {
        _list[_list.length] = task;
    }

    public function get repeat():int
    {
        return _repeat;
    }

    public function get timestamp():uint
    {
        return _timestamp;
    }

    public function get url():String
    {
        return _url;
    }

    public function get length():uint
    {
        return _list.length;
    }

    public function shift():MultiLoadData
    {
        return _list.shift();
    }
}
