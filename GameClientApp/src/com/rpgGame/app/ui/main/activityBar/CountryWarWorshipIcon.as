package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.lang.LangCountryWar;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;
	
	import org.client.mainCore.utils.Tick;
	import org.mokylin.skin.app.countryWar.CountryWarWorshipIconSkin;
	
	import starling.display.DisplayObject;
	
	
	/**
	 * 
	 * GuoDong.Zhang
	 * 2016-8-26
	 */
	public class CountryWarWorshipIcon extends SkinUI
	{
		private var _customSkin:CountryWarWorshipIconSkin
		
		public function CountryWarWorshipIcon()
		{
			_customSkin = new CountryWarWorshipIconSkin();
			super(_customSkin);
		}
		
		public function onShow():void
		{
			Tick.addCallback(tick);
			tick();
			_customSkin.lbDesc.text = "";
			var tips:String = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_WORSHIP_TIPS);
			TipTargetManager.show(this,TargetTipsMaker.makeSimpleTextTips(tips));
		}
		
		public function onHide():void
		{
			Tick.removeCallback(tick);
			TipTargetManager.remove(this);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _customSkin.icon:
					walkToNpc();
					break;
			}
		}
		
		private function tick(...args):void
		{
//			var remainStarTime:Number = CountryWarWorshipManager.endTime - SystemTimeManager.curtTm;
//			if(remainStarTime > 0)
//			{
//				_customSkin.lbDesc.text = TimeUtil.formatTimeToTimeString(remainStarTime/1000);
//			}
//			else
//			{
//				CountryWarWorshipManager.hideIcon();
//			}
		}
		
		private function walkToNpc():void
		{
			var npcId:int = NpcCfgData.enterWorshipNPCID;
//			if(!CountryManager.isAtMyCountry())
//			{
//				npcId = NpcCfgData.countryTransNPCId;
//			}
			var npcData : Q_scene_monster_area = MonsterDataManager.getSceneData(npcId);
			if (npcData)
			{
				var sceneRole : SceneRole = SceneManager.getSceneNpcByModelId(npcId);
				var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
				var searchRoleData : SearchRoleData = new SearchRoleData();
				searchRoleData.searchId = npcId;
				searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
				MainRoleSearchPathManager.walkToScene(npcData.q_mapid, pos.x, pos.y, function openPanel() : void
				{
					var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
					var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
					SceneRoleSelectManager.selectedRole = role;
					AppManager.showAppNoHide(AppConstant.TASK_DIAILOG_FUNC_PANEL, targerId);
				}, 200, searchRoleData);
			}
		}
	}
}