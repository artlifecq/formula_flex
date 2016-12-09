package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResGuildItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResGuildItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGuildItemChangeMessage = ResGuildItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}