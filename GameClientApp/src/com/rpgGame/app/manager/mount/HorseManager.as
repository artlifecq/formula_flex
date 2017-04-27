package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	import com.rpgGame.netData.horse.message.SCExtraItemNumMessage;
	import com.rpgGame.netData.horse.message.SCHorseUpResultToClientMessage;
	
	import org.client.mainCore.manager.EventManager;

	public class HorseManager
	{
		public static const HorseUpLevel:int = UNIQUEID.NEXT;
		public static const HorseChangeExp:int = UNIQUEID.NEXT;
		public static const HorseExtraItemNum:int = UNIQUEID.NEXT;
		private var _horsedataInfo:HorseDataInfo;
		private var _spellList:Vector.<BaseFaceInfo>;
		
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
		
		
		public function eatItemHorse(item:ClientItemInfo):void
		{
			
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