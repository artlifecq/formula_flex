package  com.rpgGame.app.manager.platform
{
	import com.rpgGame.app.manager.GlobalFunction;

	public class P__default implements Iplatform
	{
		protected var _name:String;
		public function P__default(name:String)
		{
			_name = name;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function phoneVerify():void
		{
			
		}
		public function downExe():void
		{
			
		}
		public function isMClinetLogin():Boolean
		{
			return false;
		}
		public function goBBS():void
		{
			
		}
		public function downLinPai():void
		{
			
		}
	}
}