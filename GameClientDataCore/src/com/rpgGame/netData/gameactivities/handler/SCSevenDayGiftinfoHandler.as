package com.rpgGame.netData.gameactivities.handler{

	import com.rpgGame.netData.gameactivities.message.SCSevenDayGiftinfoMessage;
	import org.game.netCore.net.Handler;

	public class SCSevenDayGiftinfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSevenDayGiftinfoMessage = SCSevenDayGiftinfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}