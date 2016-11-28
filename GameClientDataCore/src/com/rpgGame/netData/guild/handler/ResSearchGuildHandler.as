package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResSearchGuildMessage;
	import org.game.netCore.net.Handler;

	public class ResSearchGuildHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSearchGuildMessage = ResSearchGuildMessage(this.message);
			//TODO 添加消息处理
		}
	}
}