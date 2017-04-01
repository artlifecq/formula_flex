package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.BroadcastPlayerAttriChangeMessage;
	import org.game.netCore.net.Handler;

	public class BroadcastPlayerAttriChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: BroadcastPlayerAttriChangeMessage = BroadcastPlayerAttriChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}