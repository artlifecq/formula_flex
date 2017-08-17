package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.utils.HtmlTextUtil;

	public class FriendCfgData
	{
		public function FriendCfgData()
		{
		}
		private static var degreeColor : Array = [0x1cd51c,0x049eff,0xfdcf61,0xe161fd];
		public static var friendCountLimit:int;
		public static var blackCountLimit:int;
		public static var enemyCountLimit:int;
		public static var degreeTitle:String;
		private static var degreeArr:Array;
		/**
		 * 设置 
		 * @param data
		 * 
		 */		
//		public static function setup(data:RelationConfig):void
//		{
//			if(!data)
//				return;
//			friendCountLimit = data.friendCountLimit;
//			blackCountLimit = data.blackCountLimit;
//			enemyCountLimit = data.enemyCountLimit;
//			degreeTitle = data.degreeTitle;
//			degreeArr=[];
//			if(degreeTitle)
//			{
//				var temp: Array = degreeTitle.split("#");
//				for(var i : int = 0 ; i < temp.length;i++)
//				{
//					var tempStr : String = temp[i];
//					var tempArray : Array = tempStr.split(",");
//					tempArray.push(degreeColor[i]);
//					degreeArr.push(tempArray);
//				}
//			}
//		}
		
		public static function getDegreeString(v:int):String
		{
			for each(var temp : Array in degreeArr)
			{
				if(v<temp[0])
					return temp[1];
			}
			return "";
		}
		
		public static function getDegreeColor(v:int): uint
		{
			for each(var temp : Array in degreeArr)
			{
				if(v<temp[0])
					return temp[2];
			}
			return 0xfff;
		}
		
		public static function getDegree(v:int):String
		{
			return HtmlTextUtil.getTextColor(getDegreeColor(v),getDegreeString(v));
		}
	}
}