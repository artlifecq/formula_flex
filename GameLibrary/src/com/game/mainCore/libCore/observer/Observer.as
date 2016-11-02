//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.observer
{
    public class Observer 
    {

        public var notifyMethod:Function;
        public var notifyContext;

        public function Observer($notifyMethod:Function, $notifyContext:*)
        {
            notifyMethod = $notifyMethod;
            notifyContext = $notifyContext;
        }

        public function notifyObserver($notification:Notification):void
        {
            notifyMethod.apply(notifyContext, [$notification]);
        }

        public function compareNotifyContext($notifyContext:*):Boolean
        {
            return (($notifyContext === notifyContext));
        }


    }
}//package com.game.mainCore.libCore.observer
