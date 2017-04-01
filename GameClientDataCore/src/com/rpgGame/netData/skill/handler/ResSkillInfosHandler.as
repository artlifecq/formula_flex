package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.ResSkillInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillInfosMessage = ResSkillInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}