//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.multi.vo
{
    import flash.display.DisplayObjectContainer;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;

    public class LoadData 
    {

        public static const URLLOADER_TEXT:String = "text";
        public static const URLLOADER_BINARY:String = "binary";
        public static const URLLOADER_VARIABLES:String = "variables";
        public static const LOADER_DISPLAYOBJECT:String = "DISPLAYOBJECT";
        public static const LOADER_CLASS:String = "CLASS";

        private var _url:String;
        private var _name:String;
        private var _key:String;
        private var _priority:int;
        private var _onComplete:Function;
        private var _onUpdate:Function;
        private var _onError:Function;
        private var _decode:Function;
        private var _dataFormat:String;
        private var _container:DisplayObjectContainer;
        private var _tryCount:int;
        private var _timeOut:int;
        private var _imageDecodingPolicy:String;
        private var _isUnloadAndStop:Boolean = true;
        public var applicationDomain:ApplicationDomain;
        public var loaderContext:LoaderContext;
        public var allowLoadBytesCode:Boolean = false;
        public var allowCodeImport:Boolean = false;
        public var requestMethod:String = "GET";
        public var requestData:Object;
        public var requestHeaders:Array;
        public var userData:Object;

        public function LoadData($url:String, $onComplete:Function=null, $onUpdate:Function=null, $onError:Function=null, $name:String="", $key:String="", $priority:int=0, $dataFormat:String=null, $decode:Function=null, $container:DisplayObjectContainer=null, $tryCount:int=1, $timeOut:int=0, $imageDecodingPolicy:String="onDemand", $isUnloadAndStop:Boolean=true)
        {
            _url = $url;
            _name = $name;
            _key = $key;
            _priority = $priority;
            _onComplete = $onComplete;
            _onUpdate = $onUpdate;
            _onError = $onError;
            _dataFormat = $dataFormat;
            _decode = $decode;
            _container = $container;
            _tryCount = $tryCount;
            _timeOut = $timeOut;
            _imageDecodingPolicy = $imageDecodingPolicy;
            _isUnloadAndStop = $isUnloadAndStop;
        }

        public function get url():String
        {
            return (_url);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get key():String
        {
            return (_key);
        }

        public function get priority():int
        {
            return (_priority);
        }

        public function get onComplete():Function
        {
            return (_onComplete);
        }

        public function get onUpdate():Function
        {
            return (_onUpdate);
        }

        public function get onError():Function
        {
            return (_onError);
        }

        public function get dataFormat():String
        {
            return (_dataFormat);
        }

        public function get decode():Function
        {
            return (_decode);
        }

        public function get container():DisplayObjectContainer
        {
            return (_container);
        }

        public function get tryCount():int
        {
            return (_tryCount);
        }

        public function get timeOut():int
        {
            return (_timeOut);
        }

        public function get imageDecodingPolicy():String
        {
            return (_imageDecodingPolicy);
        }

        public function get isUnloadAndStop():Boolean
        {
            return (_isUnloadAndStop);
        }


    }
}//package org.client.load.loader.multi.vo
