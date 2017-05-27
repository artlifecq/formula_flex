package  com.client
{
	public class EnumErrorConst
	{
		// 未知错误
		public static const  UNKNOWN_ERROR:int= -1;
		
		// 服务器未开启
		public static const  SERVER_NOT_START :int= 10000;
		
		// 登录读取帐号失败
		public static const  LOGIN_LOAD_USER_FAILED :int= 10001;
		
		// 帐号禁止登录
		public static const  LOGIN_USER_FORBID :int= 10002;
		
		// 登录玩家数量达到上限
		public static const  LOGIN_TOO_MANY_PLAYER :int= 10003;
		
		// 登录密钥验证失败
		public static const  LOGIN_VERIFY_FAILED :int= 10004;
		
		// 登录没有此Gm帐号
		public static const  LOGIN_NOTHAVE_GM :int= 10006;
		
		// 登录时，玩家正在退出中
		public static const  LOGIN_ON_PLAYER_QUITIING :int= 10007;
		//登录区服错误,无此区
		public static const  LOGIN_ON_SERVERID :int= 10008;
		// 加载角色失败
		public static const  LOGIN_LOAD_PLAYER_FAILED :int= 10050;
		
		// 角色帐号错误
		public static const  LOGIN_PLAYER_ACCOUNT_ERROR :int= 10051;
		
		// 进入地图时，玩家正在退出
		public static const  ENTER_ON_PLAYER_QUIT :int= 10100;
		
		// 创建角色过多
		public static const  CREATE_TOO_MANY_PLAYER :int= 10200;
		
		// 角色创建数据库错误
		public static const  CREATE_DATABASE_ERROR :int= 10201;
		
		/**
		 * 角色创建数名字错误-名字不得少于2个汉字大小
		 */
		public static const  CREATE_NAME_ERROR_1 :int= 10202;
		
		/**
		 * 角色创建数名字错误-名字不得超过6个汉字大小
		 */
		public static const  CREATE_NAME_ERROR_2 :int= 10203;
		
		/**
		 * 角色创建数名字错误-已有相同名字存在
		 */
		public static const  CREATE_NAME_ERROR_3 :int= 10204;
		
		/**
		 * 角色创建数名字错误-玩家名字有非法字符，请输入其他名称
		 */
		public static const  CREATE_NAME_ERROR_4 :int= 10205;
		
		/**
		 * 角色创建数名字错误-玩家名字有非法字符，请输入其他名称
		 */
		public static const  CREATE_NAME_ERROR_5 :int= 10206;
		public function EnumErrorConst()
		{
		}
		
		public static function getErrorStr(reason:int):String
		{
			var str:String="未知错误"+reason;
			// 未知错误
			if(UNKNOWN_ERROR==reason)
			{
				str="未知错误";
			}
			// 服务器未开启
			else if(SERVER_NOT_START==reason)
			{
				str="服务器未开启";
			}
			// 登录读取帐号失败
			else if(LOGIN_LOAD_USER_FAILED ==reason) 
			{
				str="登录读取帐号失败";
			}
			// 帐号禁止登录
			else if(LOGIN_USER_FORBID ==reason) 
			{
				str="帐号禁止登录";
			}
			// 登录玩家数量达到上限
			else if(LOGIN_TOO_MANY_PLAYER ==reason) 
			{
				str="登录玩家数量达到上限";
			}
			// 登录密钥验证失败
			else if(LOGIN_VERIFY_FAILED ==reason) 
			{
				str="登录密钥验证失败";
			}
			// 登录没有此Gm帐号
			else if(LOGIN_NOTHAVE_GM ==reason) 
			{
				str="登录没有此Gm帐号";
			}
			// 登录时，玩家正在退出中
			else if(LOGIN_ON_PLAYER_QUITIING ==reason) 
			{
				str="登录时，玩家正在退出中";
			}//登录区服错误,无此区
			else if(LOGIN_ON_SERVERID ==reason) 
			{
				str="登录区服错误,无此区";
			}
			// 加载角色失败
			else if(LOGIN_LOAD_PLAYER_FAILED ==reason) 
			{
				str="加载角色失败";
			}
			// 角色帐号错误
			else if(LOGIN_PLAYER_ACCOUNT_ERROR ==reason) 
			{
				str="角色帐号错误";
			}
			// 进入地图时，玩家正在退出
			else if(ENTER_ON_PLAYER_QUIT ==reason) 
			{
				str="进入地图时，玩家正在退出";
			}
			// 创建角色过多
			else if(CREATE_TOO_MANY_PLAYER ==reason) 
			{
				str="创建角色过多";
			}
			// 角色创建数据库错误
			else if(CREATE_DATABASE_ERROR ==reason) 
			{
				str="角色创建数据库错误";
			}
			else if(CREATE_NAME_ERROR_1 ==reason)
			{
				str="角色创建数名字错误-名字不得少于2个汉字大小";
			}
			else if(CREATE_NAME_ERROR_2 ==reason)
			{
				str="角色创建数名字错误-名字不得超过6个汉字大小";
			}
			else if(CREATE_NAME_ERROR_3 ==reason)
			{
				str=" 角色创建数名字错误-已有相同名字存在";
			}
			else if(CREATE_NAME_ERROR_4 ==reason)
			{
				str="角色创建数名字错误-玩家名字有非法字符，请输入其他名称";
			}
			else if(CREATE_NAME_ERROR_5 ==reason) 
			{
				str="角色创建数名字错误-玩家名字有非法字符，请输入其他名称";
			}
			return str;
		}
	}
}