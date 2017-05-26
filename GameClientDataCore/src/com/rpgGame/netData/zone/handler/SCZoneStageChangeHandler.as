package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCZoneStageChangeMessage;
	import org.game.netCore.net.Handler;

	public class SCZoneStageChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCZoneStageChangeMessage = SCZoneStageChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}