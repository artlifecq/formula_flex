package com.rpgGame.netData.junjie.handler{

	import com.rpgGame.netData.junjie.message.SCJunJieActivateResultMessage;
	import org.game.netCore.net.Handler;

	public class SCJunJieActivateResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCJunJieActivateResultMessage = SCJunJieActivateResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}