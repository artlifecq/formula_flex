package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildHandleResultMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildHandleResultHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildHandleResultMessage = ResGuildHandleResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}