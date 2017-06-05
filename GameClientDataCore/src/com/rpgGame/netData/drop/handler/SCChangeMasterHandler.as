package com.rpgGame.netData.drop.handler{

	import com.rpgGame.netData.drop.message.SCChangeMasterMessage;
	import org.game.netCore.net.Handler;

	public class SCChangeMasterHandler extends Handler {
	
		public override function action(): void{
			var msg: SCChangeMasterMessage = SCChangeMasterMessage(this.message);
			//TODO 添加消息处理
		}
	}
}