package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPetRunPositionsMessage;
	import org.game.netCore.net.Handler;

	public class ResPetRunPositionsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetRunPositionsMessage = ResPetRunPositionsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}