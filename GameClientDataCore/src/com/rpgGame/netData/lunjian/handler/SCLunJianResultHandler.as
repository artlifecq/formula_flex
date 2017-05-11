package com.rpgGame.netData.lunjian.handler{

	import com.rpgGame.netData.lunjian.message.SCLunJianResultMessage;
	import org.game.netCore.net.Handler;

	public class SCLunJianResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLunJianResultMessage = SCLunJianResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}