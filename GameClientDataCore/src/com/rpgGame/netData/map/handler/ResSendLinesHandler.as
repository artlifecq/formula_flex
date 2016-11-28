package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResSendLinesMessage;
	import org.game.netCore.net.Handler;

	public class ResSendLinesHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSendLinesMessage = ResSendLinesMessage(this.message);
			//TODO 添加消息处理
		}
	}
}