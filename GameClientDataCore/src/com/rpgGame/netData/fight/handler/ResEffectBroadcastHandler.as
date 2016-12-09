package com.rpgGame.netData.fight.handler{

	import com.rpgGame.netData.fight.message.ResEffectBroadcastMessage;
	import org.game.netCore.net.Handler;

	public class ResEffectBroadcastHandler extends Handler {
	
		public override function action(): void{
			var msg: ResEffectBroadcastMessage = ResEffectBroadcastMessage(this.message);
			//TODO 添加消息处理
		}
	}
}