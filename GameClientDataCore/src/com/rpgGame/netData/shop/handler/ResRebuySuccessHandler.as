package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.ResRebuySuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResRebuySuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRebuySuccessMessage = ResRebuySuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}