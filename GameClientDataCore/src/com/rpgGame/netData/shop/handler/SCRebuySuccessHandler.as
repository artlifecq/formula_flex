package com.rpgGame.netData.shop.handler{

	import com.rpgGame.netData.shop.message.SCRebuySuccessMessage;
	import org.game.netCore.net.Handler;

	public class SCRebuySuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRebuySuccessMessage = SCRebuySuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}