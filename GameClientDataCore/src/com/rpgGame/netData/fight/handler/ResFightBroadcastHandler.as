package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	import org.game.netCore.net.Handler;

	public class ResFightBroadcastHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFightBroadcastMessage = ResFightBroadcastMessage(this.message);
			//TODO 添加消息处理
		}
	}
}