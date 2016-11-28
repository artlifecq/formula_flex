package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResItemRemoveMessage;
	import org.game.netCore.net.Handler;

	public class ResItemRemoveHandler extends Handler {
	
		public override function action(): void{
			var msg: ResItemRemoveMessage = ResItemRemoveMessage(this.message);
			//TODO 添加消息处理
		}
	}
}