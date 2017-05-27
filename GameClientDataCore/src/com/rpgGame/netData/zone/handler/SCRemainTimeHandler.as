package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCRemainTimeMessage;
	import org.game.netCore.net.Handler;

	public class SCRemainTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCRemainTimeMessage = SCRemainTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}