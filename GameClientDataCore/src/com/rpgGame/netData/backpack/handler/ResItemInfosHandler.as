package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResItemInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResItemInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResItemInfosMessage = ResItemInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}