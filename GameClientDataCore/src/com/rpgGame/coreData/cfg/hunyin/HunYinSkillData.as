package com.rpgGame.coreData.cfg.hunyin
{
	import com.rpgGame.coreData.clientConfig.Q_marriage_skills;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	/**
	 * 婚姻技能配置
	 * */
	public class HunYinSkillData
	{
		private static var _dataDic : Dictionary;
		private static var _skillLists:Vector.<Q_marriage_skills>=new Vector.<Q_marriage_skills>();
		public static function setup(data : ByteArray) : void
		{
			_dataDic = new Dictionary();
			var arr : Array = data.readObject();
			for each (var info :Q_marriage_skills in arr)
			{
				_dataDic[info.q_id] = info;
				_skillLists.push(info);
			}
		}
		
		/**
		 * 获取所有技能
		 * */
		public static function get skillLists():Vector.<Q_marriage_skills>
		{
			return _skillLists;
		}
	}
}