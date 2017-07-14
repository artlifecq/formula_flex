package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.cfg.GCDCfgData;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.CDTypeEnum;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	
	/**
	 * 技能cd管理器 
	 * @author NEIL
	 * 
	 */	
	public class SkillCDManager
	{
		/** 全局技能CD KEY **/
		//private static const GLOBAL_SKILL_KEY : String = "GLOBAL_SKILL_KEY";
		
		private var cdRecord:HashMap=new HashMap();
		
		public function SkillCDManager()
		{
		}
		
		private static var _instance : SkillCDManager;
		
		public static function getInstance() : SkillCDManager
		{
			if (!_instance)
				_instance = new SkillCDManager();
			
			return _instance;
		}
		
		
		//---------------------------------------------
		/**
		 * 设置技能当前的CD
		 * @param spellCoolDownProto
		 *
		 */
		public function setHeroCd(/*heroSpellListProto : SpellModuleObjProto*/) : void
		{
			//			if (heroSpellListProto == null)
			//				return;
			//
			//			var spellCoolDownProto : SpellCoolDownProto = heroSpellListProto.spellCoolDown;
			//			if (spellCoolDownProto == null)
			//				return;
			//
			//			spellCoolDownProto.spellCoolTime;
			//
			//			trace(spellCoolDownProto.spellCoolTime);
		}
		
		/**
		 * 得到技能CD的KEY		（加上字符SKill是为了防止与别的CD KEY相同）
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSkillKey(spellID : int) : String
		{
			return FaceTypeEnum.SKILL + "_" + spellID;
		}
		
		//-----------------------------
		/**
		 * 获取此技能CD剩余时间，包括检测公共CD剩余时间。(公共CD与自身CD返回剩余长的)
		 * @param spellType
		 * @return
		 *
		 */
		public function getSkillCDLastTime(spellProto : Q_skill_model) : uint
		{
			var isGlobal : Boolean = getSkillHasGlobal(spellProto);
			if (isGlobal)
			{
				var lastTime : uint = Math.max(CDDataManager.getCdLostTm(FaceTypeEnum.SKILL_PUBLIC), CDDataManager.getCdLostTm(getSkillKey(spellProto.q_skillID)));
				return lastTime;
			}
			
			return CDDataManager.getCdLostTm(getSkillKey(spellProto.q_skillID));
		}
		
		/**
		 * 此技能是否还有CD存在，包括公共技能的CD。
		 * @param spellType
		 * @return
		 *
		 */
		public function getSkillHasCDTime(spellProto : Q_skill_model) : Boolean
		{
			return getSkillCDLastTime(spellProto) > 0;
		}
		
		/**
		 * 这个技能是否计算公共CD
		 * @param spellType
		 * @return
		 *
		 */
		private function getSkillHasGlobal(spellProto : Q_skill_model) : Boolean
		{
			if (!spellProto)
				return false;
			var curGcd : int = GCDCfgData.getGcd(spellProto.q_public_cd_level);
			return curGcd > 0;
		}
		
		//--------------------------------------------
		/**
		*取消技能cd这个是技能被打断的时候重置当前技能cd,其他技能也要重置当前技能添加的公共cd
		**/
		public function cancelSkillCD(spellData : Q_skill_model):void
		{
			if (spellData == null)
			{
				return;
			}
			var curGcd : int = GCDCfgData.getGcd(spellData.q_public_cd_level);
			var isGlobal : Boolean = curGcd > 0;
			
			if (isGlobal) //清楚全局cd
			{
				CDDataManager.playCD(FaceTypeEnum.SKILL_PUBLIC, 0);
			}
			
			//清除当前技能的cd
			CDDataManager.playCD(getSkillKey(spellData.q_skillID),0);
			
			if (!isGlobal)
				return;
			//
			//cd换回原来的，新剩余cd=原cd-(公共cd-剩余cd)
			var spellList : Array = MainRoleManager.actorInfo.getActiveSpells();
			var len : int = spellList.length;
			var oldCD : int;
			var tmp:Q_skill_model;
			var past:int=0;
			for (var i : int = 0; i < len; i++)
			{
				tmp = spellList[i];
				if (tmp.q_skillID==spellData.q_skillID) 
				{
					continue;
				}
				if (!cdRecord.containsKey(tmp.q_skillID)) 
				{
					continue;
				}
				oldCD = cdRecord.remove(tmp.q_skillID);
				var key:String=getSkillKey(tmp.q_skillID);
				if (oldCD!=0)//使用了公共cd作为cd
				{
					//经过实践
					past=curGcd-CDDataManager.getCdLostTm(key);
					CDDataManager.playCD(key,Math.max(0,oldCD-past));
				}
				//公共cd
				else
				{
					CDDataManager.playCD(key,0);
				}
			}
		}
		/**
		 * 添加技能CD
		 * @param skillID
		 *
		 */
		public function addSkillCDTime(spellData : Q_skill_model) : void
		{
			if (spellData == null)
			{
				return;
			}
			var curGcd : int = GCDCfgData.getGcd(spellData.q_public_cd_level);
			var isGlobal : Boolean = curGcd > 0;
			if (isGlobal) //是否添加全局CD
			{
				//直接替换成当前技能的gcd为公共CD，上个公共CD现在一定完了，不然不可能释放这个技能了
				CDDataManager.playCD(FaceTypeEnum.SKILL_PUBLIC, curGcd);
			}
			
			var cdTime : int = 0; //已经经过的时间
			var configCDTime : int = spellData.q_cd; //配置的CD时间
			CDDataManager.playCD(getSkillKey(spellData.q_skillID), configCDTime, cdTime);
			
			if (!isGlobal)
				return;
			//如果是全局CD那么给影响的技能全部加上CD，如果它本身就有CD的话，留下CD长的那个
			var spellList : Array = MainRoleManager.actorInfo.getActiveSpells();
			var len : int = spellList.length;
			var skillLastCd : int;
			for (var i : int = 0; i < len; i++)
			{
				spellData = spellList[i];
				skillLastCd = CDDataManager.getCdLostTm(getSkillKey(spellData.q_skillID));
				if (skillLastCd < curGcd)//技能cd比公共cd小才播公共cd
				{
					CDDataManager.playCD(getSkillKey(spellData.q_skillID), curGcd, 0);
					cdRecord.put(spellData.q_skillID,skillLastCd);
				}
				else
				{
					cdRecord.remove(spellData.q_skillID);
				}
			}
		}
	}
}
