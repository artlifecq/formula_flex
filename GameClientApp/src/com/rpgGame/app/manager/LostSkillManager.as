package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	import com.rpgGame.netData.lostSkill.message.CSActivitSkillMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;

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
					EventManager.dispatchEvent(LostSkill_UpLevelSkillId);
				}
			}
		}
		
		public function updataSkllState(skillInfo:SkillStateInfo):void
		{
			if(skillInfo!=null&&_infos.length==0)
				curSkillId = skillInfo.skillId;
			_infos.push(skillInfo);
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
				NoticeManager.showNotify(NotifyCfgData.getNotifyTextByID(7011));
				return ;
			}
			var msg:CSActivitSkillMessage = new CSActivitSkillMessage();
			msg.skillId = data.q_id;
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
		public function LostSkillManager()
		{
		}
	}
}