package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCZoneCloseCountdownTimerMessage;
	import org.game.netCore.net.Handler;

	public class SCZoneCloseCountdownTimerHandler extends Handler {
	
		public override function action(): void{
			var msg: SCZoneCloseCountdownTimerMessage = SCZoneCloseCountdownTimerMessage(this.message);
			//TODO 添加消息处理
		}
	}
}