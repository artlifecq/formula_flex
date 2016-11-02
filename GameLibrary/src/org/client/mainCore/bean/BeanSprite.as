//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.bean
{
    import flash.display.Sprite;

    public class BeanSprite extends Sprite 
    {


        public function start():void
        {
        }

        protected function finish():void
        {
            BeanManager.initClasses();
        }


    }
}//package org.client.mainCore.bean
