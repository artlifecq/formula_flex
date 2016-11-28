package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResItemAddMessage;
	import org.game.netCore.net.Handler;

	public class ResItemAddHandler extends Handler {
	
		public override function action(): void{
			var msg: ResItemAddMessage = ResItemAddMessage(this.message);
			//TODO 添加消息处理
		}
	}
}