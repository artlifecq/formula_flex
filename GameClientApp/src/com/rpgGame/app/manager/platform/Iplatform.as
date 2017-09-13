package  com.rpgGame.app.manager.platform
{
	public interface Iplatform
	{
		
		function get name():String;	
		//手机验证
		function phoneVerify():void;
		//下载微端
		function downExe():void;
		//是否微端登录
		function isMClinetLogin():Boolean;
		
		function goBBS():void;
		
		function downLinPai():void;
	}
}