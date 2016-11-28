package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResFightFinishBroadcastMessage;
	import org.game.netCore.net.Handler;

	public class ResFightFinishBroadcastHandler extends Handler {
	
		public override function action(): void{
			var msg: ResFightFinishBroadcastMessage = ResFightFinishBroadcastMessage(this.message);
			//TODO 添加消息处理
		}
	}
}