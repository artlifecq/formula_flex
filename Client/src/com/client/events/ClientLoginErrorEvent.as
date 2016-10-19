package com.client.events
{
	import flash.events.Event;
	
	/**
	 *
	 * client登录错误信息
	 * @author fly.liuyang
	 * 创建时间：2014-3-24 上午10:13:45
	 * 
	 */
	public class ClientLoginErrorEvent extends Event
	{
		public static const LOGIN_ERROR:String = "login_error";
		
		public var errorInfo:*;
		
		public function ClientLoginErrorEvent( type:String, $errorInfo:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			errorInfo =  $errorInfo;
		}
	}
}
