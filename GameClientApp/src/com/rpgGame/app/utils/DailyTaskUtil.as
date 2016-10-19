package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.task.TouZhuManager;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.coreData.type.DailyTaskType;
	
	import org.client.mainCore.manager.EventManager;

	public class DailyTaskUtil
	{
		public function DailyTaskUtil()
		{
		}
		
		
		
		public static function joinTask( type:int ):void
		{
			switch( type )
			{
				case DailyTaskType.TOU_JING:
					TouJingManager.gotoTouJing();
					EventManager.dispatchEvent(TouJingEvent.TOU_JING_NPC, DailyTaskType.TOU_JING);
					break;
				case DailyTaskType.SECRET_MESSAGE:
					MiXinManager.gotoMiXin();
					EventManager.dispatchEvent(TouJingEvent.MI_XIN_NPC, DailyTaskType.SECRET_MESSAGE);
					break;
				case DailyTaskType.TOU_ZHU:
					TouZhuManager.gotoTouZhu();
					break;
			}
		}
		
		public static function getPrizeInfo( type:int ):Array
		{
			switch( type )
			{
				case DailyTaskType.TOU_JING:
					return [ "偷经", "偷经。。。。" ];
					
				case DailyTaskType.SECRET_MESSAGE:
					return [ "密信", "密信又称鸡毛信" ];
					
				case DailyTaskType.TOU_ZHU:
					return [ "偷猪", "偷猪、偷猪、偷猪" ];
			}
			
			return ["",""];
		}
		
	}
}