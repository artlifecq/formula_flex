package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildSkillInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildSkillInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildSkillInfoMessage = ResGuildSkillInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}