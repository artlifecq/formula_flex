package com.rpgGame.app.sender
{
	import com.rpgGame.netData.lostSkill.message.CSActivitSkillMessage;
	import com.rpgGame.netData.lostSkill.message.CSChangeSkillMessage;

	public class LostSkillSender extends BaseSender
	{
		/** 切换绝学技能 */
		public static function changeSkill(skillId:int):void
		{
			var msg:CSChangeSkillMessage = new CSChangeSkillMessage();
			msg.skillId = skillId;
			sendMsg(msg);
		}
		/** 激活绝学技能 */
		public static function activitSkill(skillId:int):void
		{
			var msg:CSActivitSkillMessage = new CSActivitSkillMessage();
			msg.skillId = skillId;
			sendMsg(msg);
		}
	}
}