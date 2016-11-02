//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.ui
{
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import org.client.load.loader.resManager.ResourceManager;
    import org.client.load.loader.queue.QueueLoader;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.display.Loader;
    import flash.utils.ByteArray;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.display.Shape;

    public class SwfLoaderMovie extends Sprite 
    {

        public static var decode:Function;

        private var _url:String = "";
        private var _defDis:DisplayObject;
        private var _movie:DisplayObject;
        private var _isCache:Boolean = false;
        private var _linkName:String = "";

        public function SwfLoaderMovie(url:String, defDis:DisplayObject=null, width:Number=50, height:Number=50, iscache:Boolean=false, linkName:String="item")
        {
            _url = url;
            if (!(defDis))
            {
                defDis = getSpRect(width, height);
            };
            _defDis = defDis;
            this.addChild(_defDis);
            this.addEventListener("removedFromStage", onRemoveFromStg);
            _isCache = iscache;
            _linkName = linkName;
            if (iscache)
            {
                ResourceManager.getResource(url, loadResLoadComplete, linkName);
            }
            else
            {
                QueueLoader.instance.load(url, onLoadComplete, onIOError, null, 2);
            };
        }

        public function destroy():void
        {
            this.removeEventListener("addedToStage", onAddToStg);
            this.removeEventListener("removedFromStage", onRemoveFromStg);
            QueueLoader.instance.cancel(_url, onLoadComplete);
            ResourceManager.cancel(_url, loadResLoadComplete);
            DisplayUtil.removeAllChild(this);
            _defDis = null;
            _movie = null;
            _url = null;
        }

        private function loadResLoadComplete(dis:DisplayObject):void
        {
            DisplayUtil.removeForParent(_defDis);
            _movie = dis;
            addChild(_movie);
        }

        private function onLoadComplete(url:String, data:ByteArray):void
        {
            if (!((decode == null)))
            {
                data = decode(data);
            };
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener("complete", onLoader);
            loader.loadBytes(data);
        }

        private function onLoader(e:Event):void
        {
            var loaderInfo:LoaderInfo = (e.target as LoaderInfo);
            loaderInfo.removeEventListener("complete", onLoader);
            DisplayUtil.removeForParent(_defDis);
            _movie = loaderInfo.content;
            this.addChild(_movie);
        }

        private function onIOError(url:String):void
        {
            trace(("素材加载出错 : " + url)); //not popped
        }

        private function onAddToStg(e:Event):void
        {
            this.removeEventListener("addedToStage", onAddToStg);
            if (!(_movie))
            {
                if (_isCache)
                {
                    ResourceManager.getResource(_url, loadResLoadComplete, _linkName);
                }
                else
                {
                    QueueLoader.instance.load(_url, onLoadComplete, onIOError, null, 2);
                };
            };
        }

        private function onRemoveFromStg(e:Event):void
        {
            this.addEventListener("addedToStage", onAddToStg);
            QueueLoader.instance.cancel(_url, onLoadComplete);
        }

        private function getSpRect(w:Number, h:Number):Shape
        {
            var sp:Shape = new Shape();
            sp.graphics.beginFill(0x5C5C5C, 0.5);
            sp.graphics.drawRect(0, 0, w, h);
            sp.graphics.endFill();
            return (sp);
        }


    }
}//package com.game.mainCore.core.ui
