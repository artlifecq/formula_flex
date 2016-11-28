package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResCountdownToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResCountdownToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCountdownToClientMessage = ResCountdownToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}