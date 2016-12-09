package com.rpgGame.netData.backpack.handler{

	import com.rpgGame.netData.backpack.message.ResUseItemSuccessMessage;
	import org.game.netCore.net.Handler;

	public class ResUseItemSuccessHandler extends Handler {
	
		public override function action(): void{
			var msg: ResUseItemSuccessMessage = ResUseItemSuccessMessage(this.message);
			//TODO 添加消息处理
		}
	}
}