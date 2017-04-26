package com.rpgGame.netData.lostSkill.handler{

	import com.rpgGame.netData.lostSkill.message.SCLostSkillInfosMessage;
	import org.game.netCore.net.Handler;

	public class SCLostSkillInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLostSkillInfosMessage = SCLostSkillInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}