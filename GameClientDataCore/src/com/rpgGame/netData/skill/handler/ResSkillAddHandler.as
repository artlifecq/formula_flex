package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.ResSkillAddMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillAddMessage = ResSkillAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}