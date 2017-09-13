package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCUpdatePlayerTitleMessage;
	import org.game.netCore.net.Handler;

	public class SCUpdatePlayerTitleHandler extends Handler {
	
		public override function action(): void{
			var msg: SCUpdatePlayerTitleMessage = SCUpdatePlayerTitleMessage(this.message);
			//TODO 添加消息处理
		}
	}
}