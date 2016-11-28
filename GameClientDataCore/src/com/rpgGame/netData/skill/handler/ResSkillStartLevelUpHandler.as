package com.rpgGame.netData.skill.handler{

	import com.rpgGame.netData.skill.message.ResSkillStartLevelUpMessage;
	import org.game.netCore.net.Handler;

	public class ResSkillStartLevelUpHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSkillStartLevelUpMessage = ResSkillStartLevelUpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}