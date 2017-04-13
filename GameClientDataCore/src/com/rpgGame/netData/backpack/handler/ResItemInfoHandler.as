package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResItemInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResItemInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResItemInfoMessage = ResItemInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}