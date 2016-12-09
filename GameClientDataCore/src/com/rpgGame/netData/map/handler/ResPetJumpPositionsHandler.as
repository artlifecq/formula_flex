package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPetJumpPositionsMessage;
	import org.game.netCore.net.Handler;

	public class ResPetJumpPositionsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPetJumpPositionsMessage = ResPetJumpPositionsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}