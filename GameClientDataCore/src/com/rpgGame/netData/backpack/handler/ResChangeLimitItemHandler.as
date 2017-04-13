package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResChangeLimitItemMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeLimitItemHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeLimitItemMessage = ResChangeLimitItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}