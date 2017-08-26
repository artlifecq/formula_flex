package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResGiftItemInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResGiftItemInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGiftItemInfoMessage = ResGiftItemInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}