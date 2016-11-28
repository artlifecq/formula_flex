package com.rpgGame.netData.store.handler{

	import com.rpgGame.netData.store.message.ResStoreItemRemoveMessage;
	import org.game.netCore.net.Handler;

	public class ResStoreItemRemoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStoreItemRemoveMessage = ResStoreItemRemoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}