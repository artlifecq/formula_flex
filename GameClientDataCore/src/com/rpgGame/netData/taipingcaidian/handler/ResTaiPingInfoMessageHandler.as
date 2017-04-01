package com.rpgGame.netData.taipingcaidian.handler{

	import com.rpgGame.netData.taipingcaidian.message.ResTaiPingInfoMessageMessage;
	import org.game.netCore.net.Handler;

	public class ResTaiPingInfoMessageHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTaiPingInfoMessageMessage = ResTaiPingInfoMessageMessage(this.message);
			//TODO 添加消息处理
		}
	}
}