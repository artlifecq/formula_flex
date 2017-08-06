package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCZoneCommonResultMessage;
	import org.game.netCore.net.Handler;

	public class SCZoneCommonResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCZoneCommonResultMessage = SCZoneCommonResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}