package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCEnterZoneMessage;
	import org.game.netCore.net.Handler;

	public class SCEnterZoneHandler extends Handler {
	
		public override function action(): void{
			var msg: SCEnterZoneMessage = SCEnterZoneMessage(this.message);
			//TODO 添加消息处理
		}
	}
}