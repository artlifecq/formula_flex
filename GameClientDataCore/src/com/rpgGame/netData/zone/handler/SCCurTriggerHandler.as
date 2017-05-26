package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCCurTriggerMessage;
	import org.game.netCore.net.Handler;

	public class SCCurTriggerHandler extends Handler {
	
		public override function action(): void{
			var msg: SCCurTriggerMessage = SCCurTriggerMessage(this.message);
			//TODO 添加消息处理
		}
	}
}