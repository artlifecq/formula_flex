package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ReplyGuildSkillLevelUpMessage;
	import org.game.netCore.net.Handler;

	public class ReplyGuildSkillLevelUpHandler extends Handler {
	
		public override function action(): void{
			var msg: ReplyGuildSkillLevelUpMessage = ReplyGuildSkillLevelUpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}