package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.ResSkillChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillChangeMessage = ResSkillChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}