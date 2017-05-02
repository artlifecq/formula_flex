package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	import com.rpgGame.netData.horse.message.CSHorseIllusionToGameMessage;
	import com.rpgGame.netData.horse.message.CSHorseStratumUpToGameMessage;
	import com.rpgGame.netData.horse.message.CSUseHorseAddtionMessage;
	import com.rpgGame.netData.horse.message.SCExtraItemNumMessage;
	import com.rpgGame.netData.horse.message.SCHorseUpResultToClientMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;

	public class HorseManager
	{
		public static const HorseUpLevel:int = UNIQUEID.NEXT;
		public static const HorseChangeExp:int = UNIQUEID.NEXT;
		public static const HorseExtraItemNum:int = UNIQUEID.NEXT;
		private var _horsedataInfo:HorseDataInfo;
		private var _spellList:Vector.<BaseFaceInfo>;
		
		private var _useExtraItem1:int;
		
		/**
		 * 资质丹使用数量
		 */
		public function get useExtraItem1():int
		{
			return _useExtraItem1;
		}

		private var _useExtarItem2:int;

		/**
		 * 成长丹使用数量 
		 */
		public function get useExtarItem2():int
		{
			return _useExtarItem2;
		}

		public function get horsedataInfo():HorseDataInfo
		{
			return _horsedataInfo;
		}

		public function set horsedataInfo(value:HorseDataInfo):void
		{
			_horsedataInfo = value;
		}
		
		public function uplevel(msg:SCHorseUpResultToClientMessage):void
		{
			_horsedataInfo.exp = msg.exp;
			if(_horsedataInfo.horseModelId !=msg.isSuccess)
			{
				_horsedataInfo.horseModelId=msg.isSuccess;
				EventManager.dispatchEvent(HorseUpLevel);
			}else{
				EventManager.dispatchEvent(HorseChangeExp);
			}
		}
		public function updateExtraItemNum(msg:SCExtraItemNumMessage):void
		{
			if(msg.type==1)
			{
				_useExtraItem1 = msg.num;
			}else if(msg.type ==2){
				_useExtarItem2 = msg.num;
			}
			EventManager.dispatchEvent(HorseExtraItemNum);
		}
		public function get spellList():Vector.<BaseFaceInfo>
		{
			return _spellList;
		}
		public function get horseConfigData():Q_horse
		{
			return HorseConfigData.getMountDataById(houseLevel);
		}
		
		private function init():void
		{
			_spellList = new Vector.<BaseFaceInfo>();
			for each(var data:Q_horse_skills in HorseSpellData.allSpell)
			{
				var skill:Q_skill_model = SpellDataManager.getSpellData(data.q_id,1);
				_spellList.push(FaceUtil.chanceSpellToFaceInfo(skill));
			}
		}
		
		public function get houseLevel():int
		{
			return _horsedataInfo.horseModelId;
		}
		
		public function eatItemHorse(showdata:MountShowData):Boolean
		{
			if(showdata.isMaxLevel)
			{
				NoticeManager.showNotifyById(9001);
				return false;
			}
			if(!showdata.canUpLevel())
			{
				NoticeManager.showNotifyById(9002,showdata.upLevelItem.qItem.q_name);
				return false;
			}
			var msg:CSHorseStratumUpToGameMessage = new CSHorseStratumUpToGameMessage();
			msg.Automatic = showdata.autoBuyItem?1:0;
			SocketConnection.send(msg);
			return true;
		}
		
		public function useExtraItemHorse(showdata:MountShowData,type:int):Boolean
		{
			var extraItemInfo:HorseExtraItemInfo = showdata.getOpenLevelBytype(type);
			var useCount:int = showdata.getUseExtralItem(type);
			if(!extraItemInfo.canUseItem(showdata.mountLevel,useCount))
			{
				NoticeManager.showNotifyById(9004,extraItemInfo.clientItemInfo.qItem.q_name);
				return false;
			}
			var msg:CSUseHorseAddtionMessage = new CSUseHorseAddtionMessage();
			msg.type = extraItemInfo.eatType;
			msg.num = 1;
			SocketConnection.send(msg);
			return true;
		}
		/**
		 * 请求坐骑切换/上马/下马 
		 * 
		 */
		public function setHouseRide():void
		{
			//坐骑未开放
			if(_horsedataInfo==null)
				return ;
			var hoseId:int = _horsedataInfo.horseModelId;
			var currentHouseid:int = HeroData(MainRoleManager.actor.data).mount;
			if(currentHouseid ==hoseId)
			{
				hoseId = 0;
			}
			var msg:CSHorseIllusionToGameMessage = new CSHorseIllusionToGameMessage();
			msg.horseModelid = hoseId;
			SocketConnection.send(msg);
		}
		
		private static var _instance:HorseManager;
		public static function instance():HorseManager
		{
			if(_instance==null)
			{
				_instance = new HorseManager();
				_instance.init();
			}
			return _instance;
		}
	}
}