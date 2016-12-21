package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResJumpSetPositionMessage;
	import org.game.netCore.net.Handler;

	public class ResJumpSetPositionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResJumpSetPositionMessage = ResJumpSetPositionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}