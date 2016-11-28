package com.rpgGame.netData.store.handler{

	import com.rpgGame.netData.store.message.ResStoreItemChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResStoreItemChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStoreItemChangeMessage = ResStoreItemChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}