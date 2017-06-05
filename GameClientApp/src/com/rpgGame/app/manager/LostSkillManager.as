package com.rpgGame.app.manager
{
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.common.CenterEftPop;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.cfg.LostSkillUpData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_up;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	import com.rpgGame.netData.lostSkill.message.CSActivitSkillMessage;
	import com.rpgGame.netData.lostSkill.message.CSChangeSkillMessage;
	
	import flash.utils.getTimer;
	
	import app.message.MonsterDataProto.MonsterType;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	public class LostSkillManager
	{
		public static const LostSkill_ChangeSkillId:int = UNIQUEID.NEXT;
		public static const LostSkill_UpLevelSkillId:int = UNIQUEID.NEXT;
		public static const LostSkill_ChangeSkillState:int = UNIQUEID.NEXT;
		private var _infos: Vector.<SkillStateInfo> = new Vector.<SkillStateInfo>();
		
		public function updataSkillInfo(cskillId:int,infos: Vector.<SkillStateInfo>):void
		{
			this.curSkillId = cskillId;
			_infos = infos;
		}
		private var _curSkillId: int=-1;

		public function get curSkillId():int
		{
			return _curSkillId;
		}

		public function set curSkillId(value:int):void
		{
			if(_curSkillId == value)
				return ;
			_curSkillId = value;
			EventManager.dispatchEvent(LostSkill_ChangeSkillId);
		}
		
		public function updataSkllLevel(skillId:int,level:int):void
		{
			for each(var skill:SkillStateInfo in _infos)
			{
				if(skill.skillId == skillId)
				{
					skill.level = level;
					UIPopManager.showAlonePopUI(CenterEftPop,"ui_shengjichenggong");
					EventManager.dispatchEvent(LostSkill_UpLevelSkillId);
				}
			}
		}
		
		public function updataSkllState(skillInfo:SkillStateInfo):void
		{
			if(skillInfo ==null)
				return ;
			_infos.push(skillInfo);
			if(_infos.length==1)
				curSkillId = skillInfo.skillId;
			
			EventManager.dispatchEvent(LostSkill_ChangeSkillState);
		}
		
		public function getSkillStateInfoById(skillId:int):SkillStateInfo
		{
			for each(var skill:SkillStateInfo in _infos)
			{
				if(skill.skillId == skillId)
					return skill;
			}
			return null;
		}
		
		public function activitSkill(data:Q_lostskill_open):void
		{
			var myMon:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD);
			if(myMon<data.q_yuanbao)
			{
				NoticeManager.showNotifyById(7011);
				return ;
			}
			var msg:CSActivitSkillMessage = new CSActivitSkillMessage();
			msg.skillId = data.q_id;
			SocketConnection.send(msg);
		}
		
		public function changeState(state:SkillStateInfo):void
		{
			if(state==null)
			{
				return ;
			}
			if(state.skillId == this.curSkillId)
			{
				return ;
			}
			
			var msg:CSChangeSkillMessage = new CSChangeSkillMessage();
			msg.skillId = state.skillId;
			SocketConnection.send(msg);
		}
		
		private static var _instance:LostSkillManager;
		public static function instance():LostSkillManager
		{
			if(_instance==null)
			{
				_instance = new LostSkillManager();
			}
			return _instance;
		}
		
		public function getSkillValue(open:Q_lostskill_open,up:Q_lostskill_up):Number
		{
			switch(open.q_type)
			{
				case 1:
				case 2:
				case 6:
				case 7:
					return up.q_value/100000;
				case 3:
				case 5:
					return up.q_value; 
				default:
					return up.q_value;
			}
		}
		public function getSkillValueByInfo(skillState:SkillStateInfo):Number
		{
			if (!skillState) 
			{
				return 0;
			}
			var qLost:Q_lostskill_open=LostSkillData.getModeInfoById(skillState.skillId);
			var up:Q_lostskill_up=LostSkillUpData.getDatabyIdAndLevel(skillState.skillId,skillState.level);
			return getSkillValue(qLost,up);
		}
		public function get openLevel():int
		{
			return 30;
		}
			
		public function LostSkillManager()
		{
		}
		
		public function checkExpNotice(heroId:long):void
		{
			var need:Boolean=needShowNotice(6001,heroId);
			if (need) 
			{
				FightFaceHelper.showBuffNameEffect(6001,heroId);
			}
		}
		public function hasExpAddAtf(heroId:long,value:int):AttackFace
		{
			var need:Boolean=needShowNotice(6001,heroId);
			if (need) 
			{
				//var tmp:int=value*getSkillValueByInfo(getSkillStateInfoById(6001));
				var atf:AttackFace=AttackFace.createAttackFace(getEffectNameUrl(6001),FightFaceHelper.NUMBER_PURPLE1,0);
				return atf;
			}
			return null;
		}
		public function getEffectNameUrl(id:int):String
		{
			var qSkill:Q_lostskill_open=LostSkillData.getModeInfoById(id);
			if (!qSkill) 
			{
				return "";
			}
			var typeRes:String = FightFaceHelper.ROOT+FightFaceHelper.USESFUL_EFFECT+qSkill.q_icon+".png";
			return typeRes;
		}
		public function hasBossHurtAddAtf(bossId:long,heroId:long,value:int):AttackFace
		{
			var target:SceneRole=SceneManager.getSceneObjByID(bossId.ToGID()) as SceneRole;
			if (!target||SceneCharType.MONSTER!=target.type) 
			{
				return null;
			}
			if ((target.data as MonsterData).monsterData.q_monster_type!=MonsterType.BOSS) 
			{
				return null;
			}
			var need:Boolean=needShowNotice(6002,heroId);
			if (need) 
			{
				//var tmp:int=value*getSkillValueByInfo(getSkillStateInfoById(6002));
				var atf:AttackFace=AttackFace.createAttackFace(getEffectNameUrl(6002),FightFaceHelper.NUMBER_PURPLE1,0);
				return atf;
			}
			return null;
		}

		public function checkRoll3Complete():void
		{
			var heroId:long=MainRoleManager.actorInfo.serverID;
			var need:Boolean=needShowNotice(6003,heroId);
			if (need) 
			{
				FightFaceHelper.showBuffNameEffect(6003,heroId);
			}
		}
		public function checkHideSelf(heroId:long):void
		{
			var need:Boolean=needShowNotice(6004,heroId);
			if (need) 
			{
				
			//	var tmp:int=getSkillValueByInfo(getSkillStateInfoById(6004));
				FightFaceHelper.showBuffNameEffect(6004,heroId,0);
			}
		}
		public function checkBigSkill(heroId:long):void
		{
			var need:Boolean=needShowNotice(6005,heroId);
			if (need) 
			{
				
				FightFaceHelper.showBuffNameEffect(6005,heroId);
			}
		}
		public function hasAttackPlayerAddAtf(bossId:long,heroId:long,value:int):AttackFace
		{
			var target:SceneRole=SceneManager.getSceneObjByID(bossId.ToGID()) as SceneRole;
			if (!target||SceneCharType.PLAYER!=target.type) 
			{
				return null;
			}
			var need:Boolean=needShowNotice(6006,heroId);
			if (need) 
			{
				//var tmp:int=value*getSkillValueByInfo(getSkillStateInfoById(6006));
				var atf:AttackFace=AttackFace.createAttackFace(getEffectNameUrl(6006),FightFaceHelper.NUMBER_PURPLE1,0);
				return atf;
			}
			return null;
		}
	
		public function hasXiQuHpAtf(heroId:long,value:int):AttackFace
		{
			var need:Boolean=needShowNotice(6007,heroId);
			if (need) 
			{
				var tmp:int=value*getSkillValueByInfo(getSkillStateInfoById(6007));
				var atf:AttackFace=AttackFace.createAttackFace(getEffectNameUrl(6007),FightFaceHelper.NUMBER_PURPLE1,tmp);
				return atf;
			}
			return null;
		}
		private function needShowNotice(buffId:int,hero:long):Boolean
		{
			var role:SceneRole=SceneManager.getSceneObjByID(hero.ToGID()) as SceneRole;
			if (role&&SceneCharType.PLAYER==role.type) 
			{
				if (role.buffSet.hasBuff(buffId)) 
				{
					return true;
				}
			}
			return false;
		}
	}
}