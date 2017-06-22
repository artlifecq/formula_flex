package com.rpgGame.netData.convoy.handler{

	import com.rpgGame.netData.convoy.message.SCSuccessInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCSuccessInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSuccessInfoMessage = SCSuccessInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}