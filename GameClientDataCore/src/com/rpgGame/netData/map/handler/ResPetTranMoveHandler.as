package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPetTranMoveMessage;
	import org.game.netCore.net.Handler;

	public class ResPetTranMoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetTranMoveMessage = ResPetTranMoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}