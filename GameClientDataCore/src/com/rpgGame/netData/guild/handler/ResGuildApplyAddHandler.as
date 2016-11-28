package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildApplyAddMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildApplyAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildApplyAddMessage = ResGuildApplyAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}