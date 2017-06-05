package com.rpgGame.netData.zhengba.handler{

	import com.rpgGame.netData.zhengba.message.SCDrawAwardResultMessage;
	import org.game.netCore.net.Handler;

	public class SCDrawAwardResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCDrawAwardResultMessage = SCDrawAwardResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}