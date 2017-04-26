package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;

	public class HorseManager
	{
		private var _spellList:Vector.<BaseFaceInfo>;
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
			return 1;
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