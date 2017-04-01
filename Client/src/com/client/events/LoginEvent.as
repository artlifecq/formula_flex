package com.client.events
{
	import flash.events.Event;
	
	/**
	 *
	 * 登录事件
	 * @author fly.liuyang
	 * 创建时间：2014-3-1 下午2:03:38
	 * 
	 */
	public class LoginEvent extends Event
	{
		public static const LOGIN_SUCESS:String = "login_sucess";
		
		/**
		 * 登录创建角色资源加载好了（login.swf），收到此事件后client可以继续处理加载后续资源 
		 */		
		public static const LOGIN_RES_COMPLETE:String = "login_res_complete";
		
		public static const LOGIN_RES_BENGIN:String = "login_res_bengin";
		public static const LOGIN_RES_PROGRESS:String = "login_res_progress";
		
		private var _data:* ;
		
		public function LoginEvent( type:String, $data:* = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_data = $data;
			super( type, bubbles, cancelable );
		}

		public function get data():*
		{
			return _data;
		}

	}
}