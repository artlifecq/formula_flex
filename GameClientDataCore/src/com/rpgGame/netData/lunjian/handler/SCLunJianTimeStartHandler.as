package com.rpgGame.netData.lunjian.handler{

	import com.rpgGame.netData.lunjian.message.SCLunJianTimeStartMessage;
	import org.game.netCore.net.Handler;

	public class SCLunJianTimeStartHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLunJianTimeStartMessage = SCLunJianTimeStartMessage(this.message);
			//TODO 添加消息处理
		}
	}
}