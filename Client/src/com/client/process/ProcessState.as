package com.client.process
{

	/**
	 *
	 * 流程状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午4:50:22
	 *
	 */
	public class ProcessState
	{
		/**
		 * 选择服务器
		 */
		public static const STATE_SELECT_DEVELOPER : String = "STATE_SELECT_DEVELOPER";
		/**
		 * 登录输入
		 */
		public static const STATE_LOGIN_INPUT : String = "STATE_LOGIN_INPUT";
		/**
		 * 加载屏蔽字库
		 */
		public static const STATE_LOAD_MASK_WORLD : String = "STATE_LOAD_MASK_WORLD";
		/**
		 * 服务器连接
		 */
		public static const STATE_SERVER_CONNECT : String = "STATE_SERVER_CONNECT";
		/**
		 * 创建角色
		 */
		public static const STATE_CREATE_CHAR : String = "STATE_CREATE_CHAR";
		/**
		 * 加载代码库
		 */
		public static const STATE_LOAD_DLL : String = "STATE_LOAD_DLL";
		/**
		 * 得到主角的相关信息 
		 */		
		public static const GET_MAINPLAYER_INFO:String = "GET_MAINPLAYER_INFO";
		/**
		 * 进入游戏
		 */
		public static const STATE_ENTER_GAME : String = "STATE_ENTER_GAME";
		
		public static const STATE_LOAD_PUBLIC_UI_ASSETS:String = "STATE_LOAD_PUBLIC_UI_ASSETS";
		
		public static const STATE_LOAD_MOUSE_ASSETS:String = "STATE_LOAD_MOUSE_ASSETS";
		
		public static const STATE_LOAD_FONTS:String = "STATE_LOAD_FONTS";
		/**
		 *随机名字 
		 */
		public static const STATE_RANDOM_NAME:String = "STATE_RANDOM_NAME";

		/**
		 *随机名字 
		 */
		public static const STATE_CLINET_INIT:String = "CLIENT_INIT";
		public function ProcessState()
		{
		}
	}
}
