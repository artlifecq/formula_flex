package org.game.netCore.net
{
    /**
     * @author Administrator
     */
    public class Handler
	{
        private var _message:Message;

        public function set message(value:Message):void
		{
            this._message = value;
        }

        public function get message():Message
		{
            return _message;
        }

        public function action():void 
		{
        }
    }
}
