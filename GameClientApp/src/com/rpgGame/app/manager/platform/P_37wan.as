package  com.rpgGame.app.manager.platform
{
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.coreData.cfg.ClientConfig;


	public class P_37wan extends P__default
	{
		public function P_37wan(name:String)
		{
			super(name);
		}
		override public function phoneVerify():void
		{
			var url:String="";
			var param:Object=ClientConfig.clientParams;
			if (param) 
			{
				url=param["phoneUrl"];
				//
//				url+="&a="+param["a"];
//				url+="&game_id="+param["game_id"];
//				url+="&sid="+param["sid"];
//				url+="&username="+param["username"];
//				url+="&actor="+param["actor"];
//				url+="&time="+param["time"];
//				url+="&sign="+param["sign37"];
				if (url!=""&&url!=null) 
				{
					GlobalFunction.OpenUrl(url);
				}
			}
		}
		override public function downExe():void
		{
			
		}
		override public function downLinPai():void
		{
			GlobalFunction.OpenUrl("lp.37.com");
		}
		override public function isMClinetLogin():Boolean
		{
			var type:int=ClientConfig.clientParams["showlogin"];
			return type==EnumLoginType.LOGIN__PLAT_CLIENT||type==EnumLoginType.LOGIN_BOX;
		}
		public function goMoreVip():void
		{
			GlobalFunction.OpenUrl("my.37.com/user/vip.php");
		}
		public function viewVip():void
		{
			GlobalFunction.OpenUrl("my.37.com/user/index.php");
		}
	}
}