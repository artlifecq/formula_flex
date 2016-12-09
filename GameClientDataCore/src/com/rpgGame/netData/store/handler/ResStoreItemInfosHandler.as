package com.rpgGame.netData.store.handler{

	import com.rpgGame.netData.store.message.ResStoreItemInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResStoreItemInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStoreItemInfosMessage = ResStoreItemInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}