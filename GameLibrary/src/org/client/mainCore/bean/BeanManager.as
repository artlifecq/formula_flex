//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.bean
{
    import flash.utils.Dictionary;
    import flash.events.EventDispatcher;
    import flash.utils.getDefinitionByName;
    import flash.events.Event;

    public class BeanManager 
    {

        private static const ID_NODE:String = "id";
        private static const CLASS_NODE:String = "class";

        private static var _dataList:Array = [];
        private static var _beanMap:Dictionary;
        private static var _current:int;
        private static var _total:int;
        private static var _ed:EventDispatcher;


        public static function config(xml:XML):void
        {
            var xmllist:XMLList = xml.elements();
            for each (var node:XML in xmllist)
            {
                add(node.attribute("id").toString(), (getDefinitionByName(node.attribute("class").toString()) as Class));
            };
        }

        public static function add(name:String, cls:Class):void
        {
            var info:BeanNodeInfo = new BeanNodeInfo();
            info.id = name;
            info.beanClass = cls;
            _dataList.push(info);
            _total = _dataList.length;
        }

        public static function remove(name:String):void
        {
            var info = null;
            var len:int = _dataList.length;
            while (len-- > 0)
            {
                info = _dataList[len];
                if ((info.id == name))
                {
                    _dataList.splice(len, 1);
                };
            };
        }

        public static function start():void
        {
            _beanMap = new Dictionary(true);
            dispatchEvent(new BeanEvent("open", _current, _total));
            initClasses();
        }

        public static function getBeanInstance(name:String)
        {
            return (_beanMap[name]);
        }

        static function initClasses():void
        {
            var info = null;
            var cls = null;
            var instance:*;
            if ((_dataList.length > 0))
            {
                info = _dataList.shift();
                cls = info.beanClass;
                instance = new (cls)();
                _beanMap[info.id] = instance;
                (trace(instance, "实例化完成"));
                dispatchEvent(new BeanEvent("progress", _current, _total));
                _current++;
                instance.start();
            }
            else
            {
                dispatchEvent(new BeanEvent("complete", _current, _total));
            };
        }

        private static function getED():EventDispatcher
        {
            if ((_ed == null))
            {
                _ed = new EventDispatcher();
            };
            return (_ed);
        }

        public static function addEventListener(type:String, listener:Function):void
        {
            getED().addEventListener(type, listener);
        }

        public static function removeEventListener(type:String, listener:Function):void
        {
            getED().removeEventListener(type, listener);
        }

        public static function dispatchEvent(e:Event):void
        {
            if (hasEventListener(e.type))
            {
                getED().dispatchEvent(e);
            };
        }

        public static function hasEventListener(type:String):Boolean
        {
            return (getED().hasEventListener(type));
        }

        public static function willTrigger(type:String):Boolean
        {
            return (getED().willTrigger(type));
        }


    }
}//package org.client.mainCore.bean
