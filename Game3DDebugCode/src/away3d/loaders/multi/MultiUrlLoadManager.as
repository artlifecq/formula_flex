package away3d.loaders.multi
{
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    
    import __AS3__.vec.Vector;
    
    import away3d.log.Log;

    public class MultiUrlLoadManager 
    {

        private static const waitingQueue:Vector.<MultiLoadData> = new Vector.<MultiLoadData>();
        private static const waitingDict:Dictionary = new Dictionary();
        private static const loadingQueue:Vector.<MultiUrlLoader> = Vector.<MultiUrlLoader>([new MultiUrlLoader(), new MultiUrlLoader(), new MultiUrlLoader()]);
        private static const loadingDict:Dictionary = new Dictionary();
        private static const multipleDict:Dictionary = new Dictionary();

        public static var getUrlWithVersion:Function;
        public static var onUrlDataLoaded:Function;
        private static var loadingSortDirty:Boolean = true;
        private static var _maxQueueSize:int = 3;
        private static var _enableInterrupt:Boolean = true;
        private static var _loadedTotalCount:int = 0;
        private static var _loadedSucceedCount:int = 0;
        private static var _failedCount:int = 0;
        private static var _interruptCount:int = 0;
        private static var _networkSpeed:Number = 0;
        private static var _loadedTotalBytes:Number = 0;
        private static var _loadedCoastTime:int = 1;
        private static var _detailLoadedBytes:Dictionary = new Dictionary();
        private static var _detailLoadedCount:Dictionary = new Dictionary();
        private static var _detailLoadSpeed:Dictionary = new Dictionary();

        public function MultiUrlLoadManager()
        {
            throw new Error("Single");
        }

        public static function set enableInterrupt(value:Boolean):void
        {
            _enableInterrupt = value;
        }

        public static function get enableInterrupt():Boolean
        {
            return _enableInterrupt;
        }

        public static function get maxQueueSize():int
        {
            return _maxQueueSize;
        }

        public static function set maxQueueSize(value:int):void
        {
            var task:MultiLoadData = null;
            if (value == _maxQueueSize)
            {
                return;
            }
            if (value < 1)
            {
                value = 1;
            }
            var i:int;
            var size:int;
            var loader:MultiUrlLoader;
            if (value > _maxQueueSize)
            {
                size = (value - _maxQueueSize);
                i = 0;
                while (i < size)
                {
                    loadingQueue[loadingQueue.length] = new MultiUrlLoader();
                    i++;
                }
                loadNext();
            }
            else
            {
                size = _maxQueueSize - value;
                i = 0;
                while (i < size)
                {
                    loader = loadingQueue.pop();
                    if (!((!loader.isLocked) && (!loader.isLoading)))
                    {
                        task = loader.rslLoadData;
                        removeFromLoadingQueueByURL(task.url, false);
                        addToWaitingQueue(task);
                        _interruptCount = (_interruptCount + 1);
                    }
                    i++;
                }
            }
            _maxQueueSize = value;
            trace("MultiUrlLoadManager 改变加载队列长度:" + _maxQueueSize);
        }

        public static function get detailLoadedCount():Dictionary
        {
            return _detailLoadedCount;
        }

        public static function get detailLoadedBytes():Dictionary
        {
            return _detailLoadedBytes;
        }

        public static function get loadedTotalCount():int
        {
            return _loadedTotalCount;
        }

        public static function get freeLoaderCount():int
        {
            var i:int;
            var loader:MultiUrlLoader = null;
            var count:int;
            i = 0;
            while (i < _maxQueueSize)
            {
                loader = loadingQueue[i];
                if (!loader.isLocked && !loader.isLoading)
                {
                    count = count + 1;
                }
                i++;
            }
            return count;
        }

        public static function get busyLoaderCount():int
        {
            return waitingQueue.length;
        }

        public static function get loadedTotalBytes():Number
        {
            return _loadedTotalBytes;
        }

        public static function get networkSpeed():Number
        {
            return _networkSpeed;
        }

        public static function get interruptCount():int
        {
            return _interruptCount;
        }

        public static function get failedCount():int
        {
            return _failedCount;
        }

        public static function get loadedSucceedCount():int
        {
            return _loadedSucceedCount;
        }

        public static function isMultiple(url:String):Boolean
        {
            if (url in loadingDict || url in waitingDict)
            {
                return true;
            }
            return false;
        }

        public static function cancelLoadByUrl(url:String):void
        {
            var task:MultiLoadData = null;
            var loader:MultiUrlLoader = (loadingDict[url] as MultiUrlLoader);
            if (loader != null)
            {
                removeFromLoadingQueueByURL(url, true);
            }
            else
            {
                task = waitingDict[url] as MultiLoadData;
                if (task != null)
                {
                    removeFromWaitingQueueByURL(url, true);
                }
            }
            loadNext();
        }

        public static function cancelLoadByUrlCallBack(func:Function):void
        {
            var index:int;
            var loadData:MultiLoadData;
            index = 0;
            while (index < _maxQueueSize)
            {
                loadData = loadingQueue[index].rslLoadData;
                if (loadData && loadData.onComplete == func)
                {
                    removeFromLoadingQueueByIndex(index, false);
                    addToWaitingQueue(shiftMultipleTask(loadData.url));
                    break;
                }
                index++;
            }
            index = 0;
            while (index < waitingQueue.length)
            {
                loadData = waitingQueue[index];
                if (loadData.onComplete == func)
                {
                    removeFromWaitingQueueByIndex(index, false);
                    addToWaitingQueue(shiftMultipleTask(loadData.url));
                    break;
                }
                index++;
            }
            loadNext();
        }

        public static function close(key:Object):void
        {
            if (key is String)
            {
                cancelLoadByUrl((key as String));
            }
            else if (key is Function)
			{
				cancelLoadByUrlCallBack((key as Function));
			}
			else
			{
				throw new Error("参数不匹配!");
			}
        }

        private static function addLoaderEvents(loader:MultiUrlLoader):void
        {
            loader.addEventListener("complete", onLoadComplete);
            loader.addEventListener("progress", onLoadProgress);
            loader.addEventListener("ioError", onLoadError);
            loader.addEventListener("networkError", onLoadError);
            loader.addEventListener("securityError", onLoadError);
        }

        private static function removeLoaderEvents(loader:MultiUrlLoader):void
        {
            loader.removeEventListener("complete", onLoadComplete);
            loader.removeEventListener("progress", onLoadProgress);
            loader.removeEventListener("ioError", onLoadError);
            loader.removeEventListener("networkError", onLoadError);
            loader.removeEventListener("securityError", onLoadError);
        }

        private static function onLoadError(event:Event):void
        {
            var loader:MultiUrlLoader = event.currentTarget as MultiUrlLoader;
            var loadTask:MultiLoadData = loader.rslLoadData;
            trace("MultiURLLoaderManager: 尝试" + loader.rslLoadData.tryCount + "次后，加载" + loader.rslLoadData.reqUrl + "失败");
            loader.isLocked = true;
            if (loadTask.onError != null)
            {
                loadTask.onError(loadTask, event);
            }
            var queue:Vector.<MultiLoadData> = multipleDict[loadTask.url];
            if (queue && queue.length > 0)
            {
                for each (var temp:MultiLoadData in queue)
                {
                    if (temp.onError != null)
                    {
                        temp.onError(temp, event);
                    }
                }
            }
            close(loadTask.url);
            _failedCount = _failedCount + 1;
            switch (event.type)
            {
                case "ioError":
                case "securityError":
                    MultiUrlBlacklistManager.register(loadTask.url);
                    Log.error("尝试加载多次失败进入黑名单,reqUrl:" + loadTask.reqUrl);
                    return;
                case "networkError":
                    return;
            }
        }

        private static function onLoadProgress(event:ProgressEvent):void
        {
            var memb:Number;
            var loader:MultiUrlLoader = (event.currentTarget as MultiUrlLoader);
            var loadTask:MultiLoadData = loader.rslLoadData;
            if (event.bytesLoaded == event.bytesTotal)
            {
                memb = (event.bytesTotal / 0x100000);
                _loadedCoastTime = (_loadedCoastTime + ((getTimer() - _detailLoadSpeed[loadTask.url]) / 1000));
                _loadedTotalBytes = (_loadedTotalBytes + memb);
                _detailLoadedBytes[loadTask.type] = (_detailLoadedBytes[loadTask.type] + memb);
                _networkSpeed = (_loadedTotalBytes / _loadedCoastTime);
                delete _detailLoadSpeed[loadTask.url];
            }
            loader.isLocked = true;
            if (loadTask.onUpdate != null)
            {
                loadTask.onUpdate(loadTask, event);
            }
            var queue:Vector.<MultiLoadData> = multipleDict[loadTask.url] as Vector.<MultiLoadData>;
            if (queue && queue.length > 0)
            {
                for each (var temp:MultiLoadData in queue)
                {
                    if (temp.onUpdate != null)
                    {
                        temp.onUpdate(temp, event);
                    }
                }
            }
            loader.isLocked = false;
        }

        private static function onLoadComplete(event:Event):void
        {
            var loader:MultiUrlLoader = (event.currentTarget as MultiUrlLoader);
            var url:String = loader.rslLoadData.url;
            var loadTask:MultiLoadData = loader.rslLoadData;
            loader.isLocked = true;
            if (onUrlDataLoaded != null)
            {
                onUrlDataLoaded(loadTask.reqUrl, loader.data);
            }
            if (loadTask.onComplete != null)
            {
                loadTask.onComplete(loadTask, event);
            }
            var queue:Vector.<MultiLoadData> = multipleDict[url] as Vector.<MultiLoadData>;
            if (queue && queue.length > 0)
            {
                if (loader.data == null)
                {
                    Log.error("MultiUrlLoadManager.Data is null");
                }
                else if (loader.data is ByteArray && (loader.data as ByteArray).length == 0)
				{
					Log.error("MultiUrlLoadManager.Data lenght is 0.");
				}
                for each (var temp:MultiLoadData in queue)
                {
                    if (temp.onComplete != null)
                    {
                        temp.onComplete(temp, event);
                    }
                }
            }
            close(loadTask.url);
            _loadedSucceedCount = (_loadedSucceedCount + 1);
            _detailLoadedCount[loadTask.type] = (_detailLoadedCount[loadTask.type] + 1);
        }

        private static function addToWaitingQueue(task:MultiLoadData):void
        {
            if (task == null)
            {
                return;
            }
            if (waitingDict[task.url])
            {
                addToMultipleQueue(task);
            }
            else
            {
                waitingDict[task.url] = task;
                waitingQueue[waitingQueue.length] = task;
                sortByPriorityAsc(waitingQueue, 0, (waitingQueue.length - 1));
            }
        }

        public static function sortByPriorityAsc(data:Vector.<MultiLoadData>, left:int, right:int):void
        {
            var priority:int;
            var pivot:MultiLoadData = null;
            var temp:MultiLoadData = null;
            var i:int;
            var j:int;
            var e:int;
            if ((right - left) < 20)
            {
                i = left + 1;
                right++;
                while (i < right)
                {
                    pivot = data[i];
                    j = (i - 1);
                    e = i;
                    priority = pivot.priority;
                    while (j >= left && data[j].priority < priority)
                    {
                        data[e--] = data[j--];
                    }
                    data[e] = pivot;
                    i++;
                }
            }
            else
            {
                i = left;
                j = right;
                pivot = data[((left + right) >>> 1)];
                priority = pivot.priority;
                while (i <= j)
                {
                    while (data[j].priority < priority)
                    {
                        j--;
                    }
                    while (data[i].priority > priority)
                    {
                        i++;
                    }
                    if (i <= j)
                    {
                        temp = data[i];
                        data[i] = data[j];
                        i++;
                        data[j] = temp;
                        j--;
                    }
                }
                if (left < j)
                {
                    sortByPriorityAsc(data, left, j);
                }
                if (i < right)
                {
                    sortByPriorityAsc(data, i, right);
                }
            }
        }

        public static function sortByLoaderPriorityAsc(data:Vector.<MultiUrlLoader>, left:int, right:int):void
        {
            var priority:int;
            var pivot:MultiUrlLoader = null;
            var temp:MultiUrlLoader = null;
            var i:int;
            var j:int;
            var e:int;
            if ((right - left) < 20)
            {
                i = left + 1;
                right++;
                while (i < right)
                {
                    pivot = data[i];
                    j = i - 1;
                    e = i;
                    priority = pivot.rslLoadData.priority;
                    while (j >= left && data[j].rslLoadData.priority < priority)
                    {
                        data[e--] = data[j--];
                    }
                    data[e] = pivot;
                    i++;
                }
            }
            else
            {
                i = left;
                j = right;
                pivot = data[((left + right) >>> 1)];
                priority = pivot.rslLoadData.priority;
                while (i <= j)
                {
                    while (data[j].rslLoadData.priority < priority)
                    {
                        j--;
                    }
                    while (data[i].rslLoadData.priority > priority)
                    {
                        i++;
                    }
                    if (i <= j)
                    {
                        temp = data[i];
                        data[i] = data[j];
                        i++;
                        data[j] = temp;
                        j--;
                    }
                }
                if (left < j)
                {
                    sortByLoaderPriorityAsc(data, left, j);
                }
                if (i < right)
                {
                    sortByLoaderPriorityAsc(data, i, right);
                }
            }
        }

        private static function loadNext():void
        {
            var task:MultiLoadData = null;
            if (waitingQueue.length == 0)
            {
                return;
            }
            var loader:MultiUrlLoader;
            for each (var temp:MultiUrlLoader in loadingQueue)
            {
                if (!temp.isLoading && !temp.isLocked)
                {
                    loader = temp;
                    break;
                }
            }
            if (loader == null && _enableInterrupt)
            {
                if (loadingSortDirty)
                {
                    sortByLoaderPriorityAsc(loadingQueue, 0, (loadingQueue.length - 1));
                    loadingSortDirty = false;
                }
                if (loadingQueue[(_maxQueueSize - 1)].rslLoadData.priority + 3000 > waitingQueue[0].priority || loadingQueue[(_maxQueueSize - 1)].isLocked)
                {
                    return;
                }
                task = loadingQueue[(_maxQueueSize - 1)].rslLoadData;
                removeFromLoadingQueueByIndex((_maxQueueSize - 1), false);
                addToWaitingQueue(task);
                loader = loadingQueue[(_maxQueueSize - 1)];
                _interruptCount = (_interruptCount + 1);
                Log.debug("MultiUrlLoadManager interrupt the loading task: " + task ? task.url : "task not found.");
            }
            processLoad(loader, shiftWaitingTask());
        }

        private static function shiftWaitingTask():MultiLoadData
        {
            var task:MultiLoadData = waitingQueue.shift();
            delete waitingDict[task.url];
            return task;
        }

        private static function shiftMultipleTask(url:String):MultiLoadData
        {
            if (!multipleDict[url])
            {
                return null;
            }
            var queue:Vector.<MultiLoadData> = multipleDict[url] as Vector.<MultiLoadData>;
            if (queue.length == 0)
            {
                return null;
            }
            return queue.shift();
        }

        private static function removeFromLoadingQueueByURL(url:String, removeMultiple:Boolean):void
        {
            if (!loadingDict[url])
            {
                return;
            }
            var loader:MultiUrlLoader = loadingDict[url];
            delete loadingDict[url];
            delete _detailLoadSpeed[url];
            removeLoaderEvents(loader);
            loader.stop();
            loader.clear();
            loader.isLocked = false;
            if (removeMultiple)
            {
                removeFromMultipleQueue(url);
            }
        }

        private static function removeFromLoadingQueueByIndex(index:int, removeMultiple:Boolean):void
        {
            if (index < 0 || index >= _maxQueueSize)
            {
                return;
            }
            var loader:MultiUrlLoader = loadingQueue[index];
            if (loader.rslLoadData)
            {
                delete loadingDict[loader.rslLoadData.url];
                delete _detailLoadSpeed[loader.rslLoadData.url];
            }
            removeLoaderEvents(loader);
            loader.stop();
            loader.clear();
            loader.isLocked = false;
        }

        private static function processLoad(loader:MultiUrlLoader, task:MultiLoadData):void
        {
            addLoaderEvents(loader);
            loadingDict[task.url] = loader;
            loader.load(task);
            loadingSortDirty = true;
            _loadedTotalCount = (_loadedTotalCount + 1);
            if (!_detailLoadedBytes[task.type])
            {
                _detailLoadedBytes[task.type] = 0;
                _detailLoadedCount[task.type] = 0;
            }
            _detailLoadSpeed[task.url] = getTimer();
        }

        private static function removeFromWaitingQueueByIndex(index:int, removeMultiple:Boolean):void
        {
            if (index < 0 || index >= waitingQueue.length)
            {
                return;
            }
            var loadData:MultiLoadData = waitingQueue[index];
            delete waitingDict[loadData.url];
            waitingQueue.splice(index, 1);
            if (removeMultiple)
            {
                removeFromMultipleQueue(loadData.url);
            }
        }

        private static function removeFromWaitingQueueByURL(url:String, removeMultiple:Boolean):void
        {
            var i:int;
            var temp:MultiLoadData = null;
            if (!waitingDict[url])
            {
                return;
            }
            delete waitingDict[url];
            var len:int = waitingQueue.length;
            i = 0;
            while (i < len)
            {
                temp = waitingQueue[i];
                if (temp.url == url)
                {
                    waitingQueue.splice(i, 1);
                    break;
                }
                i++;
            }
            if (removeMultiple)
            {
                removeFromMultipleQueue(temp.url);
            }
        }

        private static function addToMultipleQueue(task:MultiLoadData):void
        {
            if (!multipleDict[task.url])
            {
                multipleDict[task.url] = new Vector.<MultiLoadData>();
            }
            var queue:Vector.<MultiLoadData> = multipleDict[task.url] as Vector.<MultiLoadData>;
            queue[queue.length] = task;
        }

        private static function removeFromMultipleQueue(url:String):void
        {
            var queue:Vector.<MultiLoadData> = multipleDict[url] as Vector.<MultiLoadData>;
            if (queue && queue.length > 0)
            {
                queue.length = 0;
            }
            delete multipleDict[url];
        }

        public static function load(task:MultiLoadData):void
        {
            if (task == null || task.url == null)
            {
                trace("加入了一个空的加载任务到加载队列。");
                return;
            }
            if (MultiUrlBlacklistManager.add(task))
            {
                return;
            }
            var url:String = task.url;
            if (loadingDict[url] || waitingDict[task.url])
            {
                addToMultipleQueue(task);
                Log.warn("MultiUrlLoader is load a repeat MultiLoadData, url: " + url);
                return;
            }
            addToWaitingQueue(task);
            loadNext();
        }
    }
}