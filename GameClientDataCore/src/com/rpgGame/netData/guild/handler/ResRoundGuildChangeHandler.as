package com.rpgGame.netData.guild.handler{

	import com.rpgGame.netData.guild.message.ResRoundGuildChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResRoundGuildChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRoundGuildChangeMessage = ResRoundGuildChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}