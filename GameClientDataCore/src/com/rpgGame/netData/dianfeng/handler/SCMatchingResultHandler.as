package com.rpgGame.netData.dianfeng.handler{

	import com.rpgGame.netData.dianfeng.message.SCMatchingResultMessage;
	import org.game.netCore.net.Handler;

	public class SCMatchingResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMatchingResultMessage = SCMatchingResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}