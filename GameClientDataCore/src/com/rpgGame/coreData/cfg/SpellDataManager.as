package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.JobEnum;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.utils.BitUtil;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 技能数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class SpellDataManager
	{
		/** 所有技能数据 **/
		private static var _map:HashMap = new HashMap();

		/**
		 *所有职业技能表 
		 */
		private static var _jobAllMap:HashMap=new HashMap();
		/**
		 *基本职业技能表（未进阶） 
		 */
		private static var _jobBasicMap:HashMap=new HashMap();
		
		public function SpellDataManager()
		{
		}

		/**
		 * 设置学习的技能数据 
		 * @param cfg
		 * 
		 */		
		public static function setConfig(data : ByteArray) : void
		{
			var arr:Array = data.readObject();
			if (arr == null)
				return;
			var skills:Vector.<Q_skill_model>;
			for(var i:int=0;i<5;i++){
				skills=new Vector.<Q_skill_model>();
				_jobAllMap.add(JobEnum["ROLE_"+i+"_TYPE"],skills);
				skills=new Vector.<Q_skill_model>();
				_jobBasicMap.add(JobEnum["ROLE_"+i+"_TYPE"],skills);
			}
			
			for each (var skillData : Q_skill_model in arr)
			{
				_map.add(skillData.q_skillID_q_grade,skillData);
				skills=_jobAllMap.getValue(skillData.q_job);
				skills.push(skillData);
				if(skillData.q_grade==1&&skillData.q_index!=0){
					skills=_jobBasicMap.getValue(skillData.q_job);
					skills.push(skillData);
				}
			}
		}
		
		/**
		 *获取基本技能列表 
		 * @param job
		 * @return 
		 * 
		 */
		public static function getBasicSkills(job:int):Vector.<Q_skill_model>
		{
			return _jobBasicMap.getValue(job);
		}
		
		


		/**
		 * 得到技能数据
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSpellDataWithID(ID : int) : Q_skill_model
		{
			
			var grade:int=ID>>24;//前8位
			var skillId:int=ID&0xffffff;//后24位
			var v:int;
			var key:String=skillId+"_"+grade;
			return _map.getValue(key);
		}
		
		/**
		 *获取技能数据 
		 * @param skillId
		 * @param grade
		 * @return 
		 * 
		 */
		public static function getSpellData(skillId:int,grade:int=1):Q_skill_model
		{
			var key:String=skillId+"_"+grade;
			return _map.getValue(key);
		}
		
		public static function getSpellEffectData(spellID : int):Q_SpellEffect
		{
			var skillData:Q_skill_model = _map.getValue(spellID);
			
			return SpellEffectDataManager.getData(skillData.q_spell_effect);
		}
		
		public static function getSpellEffectID(spellID : int):int
		{
			var skillData:Q_skill_model = _map.getValue(spellID);
			return skillData.q_spell_effect;
		}
		
		public static function getRelateSpells(relateSpellStr : String):Vector.<Q_skill_model>
		{
			var relateSpells:Vector.<Q_skill_model> = new Vector.<Q_skill_model>();
			
			if(relateSpellStr != "")
			{
				var skillIDs:Array = relateSpellStr.split(",");
				for(var i:int=0;i<skillIDs.length;i++)
				{
					relateSpells.push(SpellDataManager.getSpellData(int(skillIDs[i])));
				}
			}
			return relateSpells;
		}

	}
}
