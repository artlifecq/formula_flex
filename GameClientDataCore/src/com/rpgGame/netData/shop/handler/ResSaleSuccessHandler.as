package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.ResSaleSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResSaleSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSaleSuccessMessage = ResSaleSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}