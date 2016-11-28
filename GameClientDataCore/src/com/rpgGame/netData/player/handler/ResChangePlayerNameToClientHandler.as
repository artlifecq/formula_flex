package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResChangePlayerNameToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResChangePlayerNameToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangePlayerNameToClientMessage = ResChangePlayerNameToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}