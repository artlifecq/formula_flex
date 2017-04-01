//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.manager
{
    import __AS3__.vec.Vector;
    import com.game.mainCore.core.iView.IQueueView;

    public class ViewQueueShowManager 
    {

        private static var _queueList:Vector.<IQueueView> = new Vector.<IQueueView>();


        public static function addView(view:IQueueView):void
        {
            _queueList.push(view);
            if (_queueList[0].view.stage)
            {
            };
        }

        public static function removeView(view:IQueueView):void
        {
        }


    }
}//package com.game.mainCore.core.manager
