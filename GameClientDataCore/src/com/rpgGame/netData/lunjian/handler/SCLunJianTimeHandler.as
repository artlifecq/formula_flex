package com.rpgGame.netData.lunjian.handler{

	import com.rpgGame.netData.lunjian.message.SCLunJianTimeMessage;
	import org.game.netCore.net.Handler;

	public class SCLunJianTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLunJianTimeMessage = SCLunJianTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}