package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.SCSkillLevelUpResultMessage;
	import org.game.netCore.net.Handler;

	public class SCSkillLevelUpResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSkillLevelUpResultMessage = SCSkillLevelUpResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}