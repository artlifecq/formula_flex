package com.rpgGame.netData.lostSkill.handler{

	import com.rpgGame.netData.lostSkill.message.SCLostSkillLevelUpResultMessage;
	import org.game.netCore.net.Handler;

	public class SCLostSkillLevelUpResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLostSkillLevelUpResultMessage = SCLostSkillLevelUpResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}