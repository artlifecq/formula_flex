package com.rpgGame.netData.map.handler{

	import com.rpgGame.netData.map.message.ResMapBlocksMessage;
	import org.game.netCore.net.Handler;

	public class ResMapBlocksHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMapBlocksMessage = ResMapBlocksMessage(this.message);
			//TODO 添加消息处理
		}
	}
}