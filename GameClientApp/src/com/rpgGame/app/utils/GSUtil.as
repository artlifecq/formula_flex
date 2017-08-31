package com.rpgGame.app.utils
{
	/**
	 *游戏中的特殊字符处理工具 
	 * @author dik
	 * 
	 */
	public class GSUtil
	{
		public function GSUtil()
		{
		}
		
		/**
		 * 无区的名称
		 * @param name
		 * @return 
		 * 
		 */
		public static function unAreaName(name:String):String
		{
			if(!name){
				return null;
			}
			var index:int=name.indexOf("]");
			if(index==-1){
				return name;
			}
			
			return name.substr(index+1);
		}
	}
}