//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.multi
{
    import org.client.load.loader.multi.loader.DobjLoader;
    import org.client.load.loader.multi.vo.LoadData;
    import flash.events.Event;

    public class DobjLoadManager 
    {

        public static var isPrint:Boolean = false;
        private static var waitLoadList:Array = [];
        private static var loaderList:Array = [];
        public static var MAX_THREAD:int = 30;
        private static var _isPriorityChg:Boolean = false;

        public function DobjLoadManager()
        {
            throw (new Error("Can not New!"));
        }

        public static function load($loadData:LoadData):void
        {
            var rslLoader:DobjLoader = getFreeLoader($loadData.priority);
            if (!((rslLoader == null)))
            {
                loadNext(rslLoader, $loadData);
            }
            else
            {
                waitLoadList.push($loadData);
                waitLoadList.sortOn("priority", (2 | 16));
            };
        }

        public static function cancelLoadByUrl($url:String):void
        {
            var i:int;
            var ld = null;
            var len:int = waitLoadList.length;
            i = (len - 1);
            while (i >= 0)
            {
                ld = waitLoadList[i];
                if ((ld.url == $url))
                {
                    waitLoadList.splice(i, 1);
                };
                i--;
            };
            for each (var rslLoader:DobjLoader in loaderList)
            {
                if (rslLoader.isLoading)
                {
                    if ((rslLoader.rslLoadData.url == $url))
                    {
                        removeLoadEvent(rslLoader);
                        rslLoader.stop(1);
                        rslLoader.clear();
                        loadNext(rslLoader);
                    };
                };
            };
        }

        public static function getUrlInLoading($url:String):Boolean
        {
            var i:int;
            var ld = null;
            var len:int = waitLoadList.length;
            i = (len - 1);
            while (i >= 0)
            {
                ld = waitLoadList[i];
                if ((ld.url == $url))
                {
                    return (true);
                };
                i--;
            };
            for each (var rslLoader:DobjLoader in loaderList)
            {
                if (rslLoader.isLoading)
                {
                    if ((rslLoader.rslLoadData.url == $url))
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public static function cancelLoadByUrlCallBack($urlCallBack:Function):void
        {
            var i:int;
            var ld = null;
            var len:int = waitLoadList.length;
            i = (len - 1);
            while (i >= 0)
            {
                ld = waitLoadList[i];
                if ((ld.onComplete == $urlCallBack))
                {
                    waitLoadList.splice(i, 1);
                };
                i--;
            };
            for each (var rslLoader:DobjLoader in loaderList)
            {
                if (rslLoader.isLoading)
                {
                    if ((rslLoader.rslLoadData.onComplete == $urlCallBack))
                    {
                        removeLoadEvent(rslLoader);
                        rslLoader.stop(2);
                        rslLoader.clear();
                        loadNext(rslLoader);
                    };
                };
            };
        }

        public static function cancelLoadByUrlAndUrlCallBack($url:String, $urlCallBack:Function):void
        {
            var i:int;
            var ld = null;
            var len:int = waitLoadList.length;
            i = (len - 1);
            while (i >= 0)
            {
                ld = waitLoadList[i];
                if ((((ld.url == $url)) && ((ld.onComplete == $urlCallBack))))
                {
                    waitLoadList.splice(i, 1);
                };
                i--;
            };
            for each (var rslLoader:DobjLoader in loaderList)
            {
                if (rslLoader.isLoading)
                {
                    if ((((rslLoader.rslLoadData.url == $url)) && ((rslLoader.rslLoadData.onComplete == $urlCallBack))))
                    {
                        removeLoadEvent(rslLoader);
                        rslLoader.stop(3);
                        rslLoader.clear();
                        loadNext(rslLoader);
                    };
                };
            };
        }

        public static function updateLoadPriority():void
        {
            _isPriorityChg = true;
        }

        private static function getFreeLoader($priority:int=0):DobjLoader
        {
            var rslLoader = null;
            var lowLoader = null;
            for each (rslLoader in loaderList)
            {
                if (((!(rslLoader.isLocked)) && (!(rslLoader.isLoading))))
                {
                    if ((rslLoader.rslLoadData == null))
                    {
                        return (rslLoader);
                    };
                };
            };
            if ((loaderList.length < MAX_THREAD))
            {
                rslLoader = new DobjLoader();
                loaderList.push(rslLoader);
                return (rslLoader);
            };
            for each (rslLoader in loaderList)
            {
                if (((((!(rslLoader.isLocked)) && (!(rslLoader.isBytesLoaded)))) && ((((lowLoader == null)) || ((lowLoader.rslLoadData.priority > rslLoader.rslLoadData.priority))))))
                {
                    lowLoader = rslLoader;
                };
            };
            if (((lowLoader) && ((lowLoader.rslLoadData.priority < $priority))))
            {
                if (isPrint)
                {
                    (trace(("取消加载,放入等待队列 : " + lowLoader.rslLoadData.url)));
                };
                removeLoadEvent(lowLoader);
                lowLoader.stop(4);
                waitLoadList.push(lowLoader.rslLoadData);
                waitLoadList.sortOn("priority", (2 | 16));
                lowLoader.clear();
                return (lowLoader);
            };
            return (null);
        }

        private static function loadNext($rslLoader:DobjLoader, $loadData:LoadData=null):void
        {
            var self = null;
            if (_isPriorityChg)
            {
                waitLoadList.sortOn("priority", (2 | 16));
                _isPriorityChg = false;
            };
            if ((((($rslLoader.isLoading) || ($rslLoader.isLocked))) || ($rslLoader.isBytesLoaded)))
            {
                return;
            };
            if (!(($loadData == null)))
            {
                self = $loadData;
            }
            else
            {
                if (waitLoadList.length > 0)
                {
                    self = waitLoadList.shift();
                };
            };
            if (!((self == null)))
            {
                initLoadEvent($rslLoader);
                $rslLoader.load(self);
            };
        }

        private static function initLoadEvent($rslLoader:DobjLoader):void
        {
            $rslLoader.addEventListener("complete", rslLoaderHandler);
            $rslLoader.addEventListener("progress", rslLoaderHandler);
            $rslLoader.addEventListener("ioError", rslLoaderHandler);
            $rslLoader.addEventListener("securityError", rslLoaderHandler);
        }

        private static function removeLoadEvent($rslLoader:DobjLoader):void
        {
            $rslLoader.removeEventListener("complete", rslLoaderHandler);
            $rslLoader.removeEventListener("progress", rslLoaderHandler);
            $rslLoader.removeEventListener("ioError", rslLoaderHandler);
            $rslLoader.removeEventListener("securityError", rslLoaderHandler);
        }

        private static function rslLoaderHandler(e:Event):void
        {
            var rslLoader:DobjLoader = (e.currentTarget as DobjLoader);
            switch (e.type)
            {
                case "complete":
                    removeLoadEvent(rslLoader);
                    if (((!((rslLoader.rslLoadData == null))) && (!((rslLoader.rslLoadData.onComplete == null)))))
                    {
                        rslLoader.isLocked = true;
                        rslLoader.rslLoadData.onComplete(rslLoader.rslLoadData, e);
                    };
                    rslLoader.stop(5);
                    rslLoader.clear();
                    rslLoader.isLocked = false;
                    loadNext(rslLoader);
                    return;
                case "progress":
                    if (((!((rslLoader.rslLoadData == null))) && (!((rslLoader.rslLoadData.onUpdate == null)))))
                    {
                        rslLoader.isLocked = true;
                        rslLoader.rslLoadData.onUpdate(rslLoader.rslLoadData, e);
                        rslLoader.isLocked = false;
                    };
                    return;
                case "ioError":
                case "securityError":
                    (trace((((("DobjLoaderManager: 尝试" + rslLoader.rslLoadData.tryCount) + "次后，加载") + rslLoader.rslLoadData.url) + "失败")));
                    removeLoadEvent(rslLoader);
                    if (((!((rslLoader.rslLoadData == null))) && (!((rslLoader.rslLoadData.onError == null)))))
                    {
                        rslLoader.isLocked = true;
                        rslLoader.rslLoadData.onError(rslLoader.rslLoadData, e);
                    };
                    rslLoader.stop(6);
                    rslLoader.clear();
                    rslLoader.isLocked = false;
                    loadNext(rslLoader);
                    return;
            };
        }


    }
}//package org.client.load.loader.multi
