package com.rpgGame.coreData.cfg
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	
	import flash.utils.ByteArray;
	
	/**
	 * 坐骑技能数据 
	 * @author 陈鹉光-2016-09-14
	 * Q_horse_skills
	 */	
	public class HorseSpellData
	{
		private static var _all:Array;
		
		public static function setConfig( data:ByteArray):void
		{
			if( data == null )
				return;
			_all = data.readObject();
		}
		
		public static  function get allSpell():Array
		{
			return _all;
		}
		
		public static function getCfgById(id:int):Q_horse_skills
		{
			if(_all==null||_all.length==0) return null;
			for each(var data:Q_horse_skills in allSpell)
			{
				if(data.q_id==id) return data;
			}
			return null;
		}
	}
}