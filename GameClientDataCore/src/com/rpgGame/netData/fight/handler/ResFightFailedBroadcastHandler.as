package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResFightFailedBroadcastMessage;
	import org.game.netCore.net.Handler;

	public class ResFightFailedBroadcastHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFightFailedBroadcastMessage = ResFightFailedBroadcastMessage(this.message);
			//TODO 添加消息处理
		}
	}
}