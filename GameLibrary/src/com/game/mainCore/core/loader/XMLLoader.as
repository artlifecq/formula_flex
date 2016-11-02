//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader
{
    import flash.events.EventDispatcher;
    import flash.net.URLStream;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import com.game.mainCore.core.loader.events.XMLEvent;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;

    [Event(name="ioError", type="flash.events.IOErrorEvent")]
    [Event(name="securityError", type="flash.events.SecurityErrorEvent")]
    [Event(name="progress", type="flash.events.ProgressEvent")]
    [Event(name="open", type="flash.events.Event")]
    [Event(name="complete", type="com.rpgGame.core.events.XMLEvent")]
    public class XMLLoader extends EventDispatcher 
    {

        private var _loader:URLStream;
        private var _isCompress:Boolean;

        public function XMLLoader()
        {
            _loader = new URLStream();
            _loader.addEventListener("complete", onComplete);
            _loader.addEventListener("open", onOpen);
            _loader.addEventListener("progress", onProgress);
            _loader.addEventListener("ioError", onIoError);
            _loader.addEventListener("securityError", onSecurityError);
        }

        public function get connected():Boolean
        {
            return (_loader.connected);
        }

        public function load(url:String, isCompress:Boolean=false):void
        {
            _loader.load(new URLRequest(url));
            _isCompress = isCompress;
        }

        public function close():void
        {
            if (_loader.connected)
            {
                _loader.close();
            };
        }

        public function destroy():void
        {
            close();
            _loader.removeEventListener("complete", onComplete);
            _loader.removeEventListener("open", onOpen);
            _loader.removeEventListener("progress", onProgress);
            _loader.removeEventListener("ioError", onIoError);
            _loader.removeEventListener("securityError", onSecurityError);
            _loader = null;
        }

        private function onOpen(e:Event):void
        {
            dispatchEvent(e);
        }

        private function onComplete(e:Event):void
        {
            var data:ByteArray = new ByteArray();
            _loader.readBytes(data);
            if (_isCompress)
            {
                data.uncompress();
            };
            dispatchEvent(new XMLEvent("complete", XML(data.readUTFBytes(data.bytesAvailable))));
        }

        private function onProgress(e:ProgressEvent):void
        {
            dispatchEvent(e);
        }

        private function onIoError(e:IOErrorEvent):void
        {
            dispatchEvent(e);
            trace(e.text); //not popped
        }

        private function onSecurityError(e:SecurityErrorEvent):void
        {
            dispatchEvent(e);
            throw (new SecurityError(e.text));
        }


    }
}//package com.game.mainCore.core.loader
