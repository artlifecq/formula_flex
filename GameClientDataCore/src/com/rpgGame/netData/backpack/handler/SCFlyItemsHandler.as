package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.SCFlyItemsMessage;
	import org.game.netCore.net.Handler;

	public class SCFlyItemsHandler extends Handler {
	
		public override function action(): void{
			var msg: SCFlyItemsMessage = SCFlyItemsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}