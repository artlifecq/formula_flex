package com.rpgGame.app.manager.ctrl
{
	import com.rpgGame.app.manager.SpellManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;

	public class ControlTripleSkill
	{
		public function ControlTripleSkill()
		{
		}
		private var _originSkill:int;
		/**
		 *三连击技能列表 
		 */        
		private var _skills:Array;
		
		public function setParams(skill:int):void
		{
			_originSkill=skill;
			var qSkill:Q_skill_model=SpellDataManager.getSpellData(skill,SpellManager.getSkillGrade(skill));
			_skills=null;
			if (qSkill.q_relate_spells!="" /*|| qSkill.q_relate_spells!=null*/) 
			{
				_skills=qSkill.q_relate_spells.split(",");
			}
		}
		public function isTripleSkill(skillId:int):Boolean
		{
			if (_skills==null) 
			{
				return false;
			}
			return _skills.indexOf(skillId+"")!=-1
		}
		public function isLastTripleSkill(skillId:int):Boolean
		{
			if (_skills==null||_skills.length==0) 
			{
				return true;
			}
			var index:int=_skills.indexOf(skillId+"");
			if (index==-1) 
			{
				return true;
			}
			return index==(_skills.length-1);
		}
		//不安全
		public function getNextTripleSkill(skill:int):int
		{
			var index:int=_skills.indexOf(skill+"");
			return _skills[index+1];
		}
	}
}