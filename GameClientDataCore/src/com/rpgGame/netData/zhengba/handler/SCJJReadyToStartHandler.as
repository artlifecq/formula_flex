package com.rpgGame.netData.zhengba.handler{

	import com.rpgGame.netData.zhengba.message.SCJJReadyToStartMessage;
	import org.game.netCore.net.Handler;

	public class SCJJReadyToStartHandler extends Handler {
	
		public override function action(): void{
			var msg: SCJJReadyToStartMessage = SCJJReadyToStartMessage(this.message);
			//TODO 添加消息处理
		}
	}
}