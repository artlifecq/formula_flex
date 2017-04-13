package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPetStopMessage;
	import org.game.netCore.net.Handler;

	public class ResPetStopHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetStopMessage = ResPetStopMessage(this.message);
			//TODO 添加消息处理
		}
	}
}