package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.ResSkillResetEffectsidMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillResetEffectsidHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillResetEffectsidMessage = ResSkillResetEffectsidMessage(this.message);
			//TODO 添加消息处理
		}
	}
}