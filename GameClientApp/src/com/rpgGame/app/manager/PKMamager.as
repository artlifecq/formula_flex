package com.rpgGame.app.manager
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.utils.PKModeUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;

	/**
	 * 主角PK相关管理 
	 * @author wewell
	 * 
	 */	
	public class PKMamager
	{
		private static var PK_MODE_CHANG_LIMIT_TIME:int = 5*1000;
		private static var _curPK:int;
		public function PKMamager()
		{
		}
		
		setup();

		public static function get curPK():int
		{
			return _curPK;
		}

		private static function setup():void
		{
			EventManager.addEvent(MainPlayerEvent.PK_MODE_CHANGE, onPkModeChange);
		}

		public static function HeroSetPKMode(pkMode:int):void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if(!sceneData)return;
			
			var curPkMode:int = MainRoleManager.actorInfo.pkMode;
			if(curPkMode == pkMode)
			{
				return;
			}
			
/*			if(mapInfo.mapData.mapType ==  EnumMapType.MAP_TYPE_NORMAL)
			{
				if(NormalSceneData(mapInfo.mapData).isCountryWarMap && curPkMode == PKModeType.COUNTRY)
				{
					NoticeManager.notify(NoticeManager.SYSTEM_SWITCH,"您正在进行国战（资源战），无法切换PK模式");
					return;
				}
			}*/
			
			if(!TimerServer.hasPassedTime(HeroSetPKMode,PK_MODE_CHANG_LIMIT_TIME))
			{
				NoticeManager.systemSwitchNotify("您才切换过PK模式，请稍后再试");
				return;
			}
			
			if(MainRoleManager.actorInfo.pkMode != pkMode)
			{
				if(sceneData.fixedPkMode > 0)
				{
					NoticeManager.systemSwitchNotify("当前场景不能切换PK模式");
					return;
				}
			}
			HeroMiscSender.reqChangePKMode(pkMode);
		}
		
		private static function onPkModeChange():void
		{
			var curPkMode:int = MainRoleManager.actorInfo.pkMode;
			var modeName:String = PKModeUtil.getPKModeInfo(curPkMode);
			var color:String = StaticValue.tran16ToStr(PKModeUtil.getPKModeColor(curPkMode));
			NoticeManager.systemSwitchNotify("您的PK模式切换为：<font color='"+color+"'>"+modeName+"模式</font>");
		}
		/**
		 *策划要求，改了攻击模式，周围玩家血条颜色对应调整 
		 * @param pkState
		 * 
		 */		
		public static function setPkMode(pkState:int):void
		{
			// TODO Auto Generated method stub
			_curPK=pkState;
			//更新其他玩家血条颜色
			var getScenePlayerList:Vector.<SceneRole> = SceneManager.getScenePlayerList();
			for each (var player:SceneRole in getScenePlayerList) 
			{
				if (player!=MainRoleManager.actor) 
				{
					if(player.headFace is HeadFace)
					{
						(player.headFace as HeadFace).checkBloodState();
					}
				}
			}
		}
	}
}