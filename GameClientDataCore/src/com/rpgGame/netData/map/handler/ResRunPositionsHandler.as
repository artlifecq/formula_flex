package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResRunPositionsMessage;
	import org.game.netCore.net.Handler;

	public class ResRunPositionsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRunPositionsMessage = ResRunPositionsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}