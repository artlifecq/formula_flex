package com.rpgGame.netData.lostSkill.handler{

	import com.rpgGame.netData.lostSkill.message.SCActvitSkillResultMessage;
	import org.game.netCore.net.Handler;

	public class SCActvitSkillResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCActvitSkillResultMessage = SCActvitSkillResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}