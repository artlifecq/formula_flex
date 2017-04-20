package com.rpgGame.netData.lostSkill.handler{

	import com.rpgGame.netData.lostSkill.message.SCChangeSkillResultMessage;
	import org.game.netCore.net.Handler;

	public class SCChangeSkillResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCChangeSkillResultMessage = SCChangeSkillResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}