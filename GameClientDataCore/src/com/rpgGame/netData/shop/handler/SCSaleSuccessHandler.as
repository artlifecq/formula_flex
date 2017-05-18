package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.SCSaleSuccessMessage;
	import org.game.netCore.net.Handler;

	public class SCSaleSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSaleSuccessMessage = SCSaleSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}