package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResSetPositionMessage;
	import org.game.netCore.net.Handler;

	public class ResSetPositionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSetPositionMessage = ResSetPositionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}