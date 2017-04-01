package com.rpgGame.netData.store.handler{

	import com.rpgGame.netData.store.message.ResStoreItemAddMessage;
	import org.game.netCore.net.Handler;

	public class ResStoreItemAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStoreItemAddMessage = ResStoreItemAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}