package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	
	import away3d.bounds.NullBounds;
	
	public class TripleAttackSpellLockStateReference extends RoleStateReference
	{
		public var startSkill:int;
		/**
		 *三连击技能列表 
		 */		
		private var _skills:Array;
		public function TripleAttackSpellLockStateReference()
		{
			super();
		}
		public function setParams(skill:int):void
		{
			this.startSkill=skill;
			var qSkill:Q_skill_model=SpellDataManager.getSpellData(skill);
			_skills=null;
			if (qSkill.q_relate_spells!="") 
			{
				_skills=qSkill.q_relate_spells.split(",");
			}
		}
		public function isLockSkill(skillId:int):Boolean
		{
			if (_skills==null) 
			{
				return false;
			}
			return _skills.indexOf(skillId+"")!=-1
		}
		public function isLast(skillId:int):Boolean
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
		public function getNextSkill(skill:int):int
		{
			var index:int=_skills.indexOf(skill+"");
			return _skills[index+1];
		}
	}
}