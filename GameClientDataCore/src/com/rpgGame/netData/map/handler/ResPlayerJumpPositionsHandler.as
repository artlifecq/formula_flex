package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResPlayerJumpPositionsMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerJumpPositionsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerJumpPositionsMessage = ResPlayerJumpPositionsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}