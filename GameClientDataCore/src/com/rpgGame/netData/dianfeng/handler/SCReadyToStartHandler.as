package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCReadyToStartMessage;
	import org.game.netCore.net.Handler;

	public class SCReadyToStartHandler extends Handler {
	
		public override function action(): void{
			var msg: SCReadyToStartMessage = SCReadyToStartMessage(this.message);
			//TODO 添加消息处理
		}
	}
}