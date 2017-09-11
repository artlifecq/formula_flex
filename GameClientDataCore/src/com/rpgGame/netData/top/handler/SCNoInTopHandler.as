package com.rpgGame.netData.top.handler{

	import com.rpgGame.netData.top.message.SCNoInTopMessage;
	import org.game.netCore.net.Handler;

	public class SCNoInTopHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNoInTopMessage = SCNoInTopMessage(this.message);
			//TODO 添加消息处理
		}
	}
}