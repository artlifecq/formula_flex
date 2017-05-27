package com.rpgGame.app.manager.ctrl
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.HeroData;
	
	public class ControlAutoFightSelectSkill extends SceneObjectControlBase
	{
		private var skillIndex:int=-1;
		private var skillArr:Array;
		private var _skillNum:int;
		public function ControlAutoFightSelectSkill(tar:SceneRole)
		{
			super(tar);
			initSkills();
		}
		private function initSkills():void
		{
			var heroData:HeroData=_co.data as HeroData;
			if (JobEnum.ROLE_1_TYPE==heroData.job) 
			{
				skillArr=JSONUtil.decode( GlobalSheetData.getSettingInfo(718).q_string_value);
			}
			else if (JobEnum.ROLE_2_TYPE==heroData.job||JobEnum.ROLE_3_TYPE==heroData.job) 
			{
				skillArr=JSONUtil.decode( GlobalSheetData.getSettingInfo(719).q_string_value);
			}
			else if (JobEnum.ROLE_4_TYPE==heroData.job) 
			{
				skillArr=JSONUtil.decode( GlobalSheetData.getSettingInfo(720).q_string_value);
			}
			if (skillArr==null) 
			{
				throw new Error("自动战斗技能未设置");
			}
			_skillNum=skillArr.length;
		}
		public  function getNextSkillId():int
		{
			skillIndex++;
			skillIndex%=skillNum;
			return skillArr[skillIndex];
		}

		public function get skillNum():int
		{
			return _skillNum;
		}

		
	}
}