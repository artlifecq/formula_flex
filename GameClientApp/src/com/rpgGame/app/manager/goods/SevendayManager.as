package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.graphics.title.IBaseTitle;
	import com.rpgGame.netData.gameactivities.bean.SevenDayInfo;

	/**
	 * 7日豪礼管理
	 * @author YT
	 */
	public class SevendayManager
	{
		/**当前时间（登陆天数）*/
		public static var loginDay:int=0
		/**领奖天数*/
		public static var rewardSuccess:Array;
		public function SevendayManager()
		{
			
		}
		public static function setSevenData(day:int,infos:Vector.<SevenDayInfo>):void
		{
			loginDay=day;
			rewardSuccess=new Array();
			infos.sort(onSort);
			for each(var info:SevenDayInfo in infos)
			{
				rewardSuccess.push(info.state);
			}
		}
		public static function setRewardSeccessData(day:int):void
		{
			var id:int=day-1;
			if(rewardSuccess&&rewardSuccess.length>id)
			{
				rewardSuccess[id]=2;
			}
		}
		private static function onSort(a:SevenDayInfo,b:SevenDayInfo):int
		{
			if (a.activeId>b.activeId) 
			{
				return 1;
			}
			else
			{
				return -1;
			}
			return 0;
		}
		
		
		
		
	}
}