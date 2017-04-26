package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.netData.lostSkill.message.SCActvitSkillResultMessage;
	import com.rpgGame.netData.lostSkill.message.SCChangeSkillResultMessage;
	import com.rpgGame.netData.lostSkill.message.SCLostSkillInfosMessage;
	import com.rpgGame.netData.lostSkill.message.SCLostSkillLevelUpResultMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class LostSkillCmdListener extends BaseBean
	{
		
		override public function start():void
		{
			SocketConnection.addCmdListener(224501, updataSCLostSkillInfosMessage);
			SocketConnection.addCmdListener(224502, updataSCActvitSkillResultMessage);
			SocketConnection.addCmdListener(224503, updataSCChangeSkillResultMessage);
			SocketConnection.addCmdListener(224504, updataSCLostSkillLevelUpResultMessage);
			finish();
		}
		private function updataSCLostSkillInfosMessage(msg:SCLostSkillInfosMessage):void
		{
			LostSkillManager.instance().updataSkillInfo(msg.curSkillId,msg.infos);
		}
		
		private function updataSCActvitSkillResultMessage(msg:SCActvitSkillResultMessage):void
		{
			LostSkillManager.instance().updataSkllState(msg.info);
		}
		
		private function updataSCChangeSkillResultMessage(msg:SCChangeSkillResultMessage):void
		{
			LostSkillManager.instance().curSkillId = msg.skillId;
		}
		
		private function updataSCLostSkillLevelUpResultMessage(msg:SCLostSkillLevelUpResultMessage):void
		{
			LostSkillManager.instance().updataSkllLevel(msg.skillId,msg.level);
		}
		
	}
}