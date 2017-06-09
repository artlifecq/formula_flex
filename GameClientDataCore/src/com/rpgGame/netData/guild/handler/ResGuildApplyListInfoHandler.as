package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildApplyListInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildApplyListInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildApplyListInfoMessage = ResGuildApplyListInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}