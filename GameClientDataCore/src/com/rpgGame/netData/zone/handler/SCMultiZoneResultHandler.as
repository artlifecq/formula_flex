package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCMultiZoneResultMessage;
	import org.game.netCore.net.Handler;

	public class SCMultiZoneResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMultiZoneResultMessage = SCMultiZoneResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}