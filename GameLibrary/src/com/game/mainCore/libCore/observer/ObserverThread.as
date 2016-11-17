package com.game.mainCore.libCore.observer
{
    public class ObserverThread 
    {

        private var _observerMap:Object;

        public function ObserverThread()
        {
            _observerMap = {};
            super();
        }

        public function clear():void
        {
            _observerMap = {};
        }

        public function registerObserver($notificationName:*, $observer:Observer):void
        {
            if (_observerMap[$notificationName] != null)
            {
                _observerMap[$notificationName].push($observer);
            }
            else
            {
                _observerMap[$notificationName] = [$observer];
            };
        }

        public function removeObserver($notificationName:*, $notifyContext:*):void
        {
            var i:int;
            var observers:Array = _observerMap[$notificationName] as Array;
            i = (observers.length - 1);
            while (i >= 0)
            {
                if (Observer(observers[i]).compareNotifyContext($notifyContext))
                {
                    observers.splice(i, 1);
                    break;
                }
                i--;
            }
            if (observers.length == 0)
            {
                delete _observerMap[$notificationName];
            }
        }

        public function removeObserverByNotificationName($notificationName:*):void
        {
            if (_observerMap.hasOwnProperty($notificationName))
            {
                _observerMap[$notificationName] = null;
                delete _observerMap[$notificationName];
            }
        }

        public function removeObserverByNotifyContext($notifyContext:*):void
        {
            for (var notificationName:* in _observerMap)
            {
                removeObserver(notificationName, $notifyContext);
            }
        }

        public function notifyObservers($notification:Notification):void
        {
            var observers:Array = null;
            var observer:Observer = null;
            var i:int;
            var observers_ref:Array = _observerMap[$notification.name] as Array;
            if (observers_ref != null)
            {
                observers = [];
                i = 0;
                while (i < observers_ref.length)
                {
                    observer = observers_ref[i];
                    observers.push(observer);
                    i++;
                }
                i = 0;
                while (i < observers.length)
                {
                    observer = (observers[i] as Observer);
                    observer.notifyObserver($notification);
                    i++;
                }
            }
        }
    }
}