package org.client.mainCore.bean
{
    public class BaseBean 
    {
        public function start():void
        {
        }

        protected function finish():void
        {
            BeanManager.initClasses();
        }
    }
}