package com.rpgGame.core.manager
{
	public class EscActionManager
	{
		public function EscActionManager()
		{
		}
		
		private static var _actionList:Vector.<Object> = new Vector.<Object>;
		
		public static function addAction($escFun:Function,$escFunPramas:Array=null):void
		{
			var info:Object = {escFun:$escFun,escFunPramas:$escFunPramas};
			_actionList.push(info);
		}
		
		public static function removeAction($escFun:Function):void
		{
			var len:int = _actionList.length;
			while(len-->0)
			{
				var info:Object = _actionList[len];
				if(info.escFun == $escFun)
				{
					_actionList.splice(len,1);
				}
			}
		}
		
		public static function executeAction():Boolean
		{
			if(_actionList.length)
			{
				var info:Object = _actionList.shift();
				info.escFun.apply(null,info.escFunPramas);
				return true;
			}
			return false;
		}
		
	}
}