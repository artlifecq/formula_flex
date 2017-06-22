package com.rpgGame.netData.daysdowngold.handler{

	import com.rpgGame.netData.daysdowngold.message.SCRemainRefreshTimeMessage;
	import org.game.netCore.net.Handler;

	public class SCRemainRefreshTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRemainRefreshTimeMessage = SCRemainRefreshTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}