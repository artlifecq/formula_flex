package com.rpgGame.app.manager.fightsoul
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangFightSoul;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.fightsoul.bean.FightSoulInfo;
	import com.rpgGame.netData.fightsoul.bean.TypeValue;
	import com.rpgGame.netData.fightsoul.message.CSFightSoulChangeModelMessage;
	import com.rpgGame.netData.fightsoul.message.CSFightSoulLevelUpMessage;
	import com.rpgGame.netData.fightsoul.message.CSFightSoulRewardMessage;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;

	public class FightSoulManager
	{
		public static const FightSoul_Level:int = UNIQUEID.NEXT;
		public static const FightSoul_Exp:int = UNIQUEID.NEXT;
		public static const FightSoul_Vitality:int = UNIQUEID.NEXT;
		public static const FightSoul_ModeLevel:int = UNIQUEID.NEXT;
		public static const FightSoul_TypeValue:int = UNIQUEID.NEXT;
		public static const FightSoul_GetReward:int = UNIQUEID.NEXT;
		/**
		 * 战魂数据
		 */
		private var _fightSoulInfo: FightSoulInfo;
		public function get fightSoulInfo(): FightSoulInfo{
			return _fightSoulInfo;
		}
		public function set fightSoulInfo(value: FightSoulInfo): void{
			this._fightSoulInfo = value;
			updataSceneMode();
			updataSKill();
		}
		
		private var _rewards:Vector.<ClientItemInfo>;
		public function get RewardInfos():Vector.<ClientItemInfo>
		{
			return _rewards;
		}
		private function init():void
		{
			_rewards = new Vector.<ClientItemInfo>();
			var itemInfos:Object = JSONUtil.decode( GlobalSheetData.getSettingInfo(501).q_string_value);
			for each(var iteminfo:Object in itemInfos)
			{
				var item:ItemInfo = new ItemInfo();
				item.itemModelId = iteminfo["mod"];
				item.num = iteminfo["num"];
				item.parameters = iteminfo["paras"]["lv"];
				var client:ClientItemInfo = new ClientItemInfo(item.itemModelId);
				client.itemInfo = item;
				_rewards.push(client);
			}
		}
		
		public function updata(level:int,exp:int):void
		{
			this._fightSoulInfo.level = level;
			this._fightSoulInfo.exp = exp;
			updataSKill();
			EventManager.dispatchEvent(FightSoul_Level);
			EventManager.dispatchEvent(FightSoul_Exp);
		}
		
		public function updataReward(rewardBit: int):void
		{
			this._fightSoulInfo.rewardBit = rewardBit;
			EventManager.dispatchEvent(FightSoul_GetReward);
		}
		
		public function updataExp(exp:int,vitality: int):void
		{
			this.fightSoulInfo.exp = exp;
			this.fightSoulInfo.vitality = vitality;
			EventManager.dispatchEvent(FightSoul_Exp);
			EventManager.dispatchEvent(FightSoul_Vitality);
		}
		
		public function get  currentLeveldata():Q_fightsoul
		{
			return FightsoulData.getInfobyId(_fightSoulInfo.level);
		}
		
		public function updataCount(type:int,count:int):void
		{
			for each(var date:TypeValue in fightSoulInfo.values)
			{
				if(date.type == type)
				{
					date.count = count;
					break;
				}
			}
			EventManager.dispatchEvent(FightSoul_TypeValue);
		}
		
		public function updateMode(level:int):void
		{
			fightSoulInfo.curModelLv = level;
			updataSceneMode();
			EventManager.dispatchEvent(FightSoul_ModeLevel);
		}
		
		public function get currentMode():Q_fightsoul
		{
			return FightsoulData.getInfobyId(_fightSoulInfo.curModelLv);
		}
		
		public function FightSoulLevelUp():void
		{
			if(fightSoulInfo.exp<currentLeveldata.q_exp)
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFightSoul.FightSoulError1));
				return ;
			}
			SocketConnection.send(new CSFightSoulLevelUpMessage());
		}
		
		public function chageModeLevel(level:int):void
		{
			var msg:CSFightSoulChangeModelMessage = new CSFightSoulChangeModelMessage();
			msg.changeModelLv = level;
			SocketConnection.send(msg);
		}
		
		public function getRewardByIndex(index:int):void
		{
			if(isGetReward(index))
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFightSoul.FightSoulIsGetReward));
				return ;
			}
			var reward:ClientItemInfo = _rewards[index];
			if(int(reward.itemInfo.parameters)>FightSoulManager.instance().fightSoulInfo.vitality)
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFightSoul.FightSoulNotVitality));
				return ;
			}
			var rewardmsg:CSFightSoulRewardMessage = new CSFightSoulRewardMessage();
			rewardmsg.bitReward = index;
			SocketConnection.send(rewardmsg);
		}
		
		public function getActivityByType(type:int):int
		{
			for each(var typevalue:TypeValue in fightSoulInfo.values)
			{
				if(typevalue.type == type)
					return typevalue.count;
			}
			return 0;
		}
		
		public function isGetReward(index:int):Boolean
		{
			if(index>3)
				return false;
			else
				return (this._fightSoulInfo.rewardBit&(1<<index))>0;
		}
		
		private function updataSceneMode():void
		{
			var player : SceneRole = MainRoleManager.actor;
			if (null == player || !player.usable) {
				return;
			}
			var heroData : HeroData = player.data as HeroData; 
			heroData.fightSoulLevel =1;// _fightSoulInfo.curModelLv;
			AvatarManager.callEquipmentChange(player);
		}
		private var _skillData:Q_skill_model;
		public function getSpellData():Q_skill_model
		{
			return _skillData;
		}
		private function updataSKill():void
		{
			var skillId:int = int(GlobalSheetData.getSettingInfo(500).q_string_value);
			var quilty:int = currentLeveldata.q_quality;
			_skillData =  SpellDataManager.getSpellData(skillId,quilty);
			var info:SkillInfo= new SkillInfo();
			info.skillModelId = skillId;
			info.skillChildLv = _fightSoulInfo.level;
			info.skillLevel = quilty;
			MainRoleManager.actorInfo.otherList.addSkillData(info);
		}
		
		private static var _instance:FightSoulManager;
		public static function instance():FightSoulManager
		{
			if(_instance==null)
			{
				_instance = new FightSoulManager();
				_instance.init();
			}
			return _instance;
		}
	}
}