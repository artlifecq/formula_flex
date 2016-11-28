package com.game.mainCore.core.manager
{
    import com.game.mainCore.core.iView.IQueueView;
    
    import flash.events.Event;
    
    import __AS3__.vec.Vector;

    public class QueueViewShowManager 
    {

        private static var _curtView:IQueueView;
        private static var _queueList:Vector.<IQueueView> = new Vector.<IQueueView>();


        public static function addView(view:IQueueView):void
        {
            _queueList.push(view);
            _curtView = _queueList[0];
            if (!(_curtView && _curtView.view.parent))
            {
                _curtView.excuteShow();
            }
            if (_curtView && _curtView.view)
            {
                _curtView.view.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStg);
            }
        }

        public static function removeView(view:IQueueView):void
        {
            var qView:IQueueView = null;
            var index:int = _queueList.indexOf(view);
            if (index != -1)
            {
                qView = _queueList[index];
                if (qView && qView.view)
                {
                    qView.view.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStg);
                }
                _queueList.splice(index, 1);
            }
        }

        private static function onRemoveFromStg(e:Event):void
        {
            var qView:IQueueView = _queueList.shift();
            if (qView && qView.view)
            {
                qView.view.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStg);
            }
            if (_queueList.length)
            {
                _curtView = _queueList[0];
                _curtView.excuteShow();
                if (_curtView && _curtView.view)
                {
                    _curtView.view.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStg);
                }
            }
        }
    }
}