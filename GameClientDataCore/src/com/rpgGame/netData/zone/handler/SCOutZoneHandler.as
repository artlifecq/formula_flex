package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCOutZoneMessage;
	import org.game.netCore.net.Handler;

	public class SCOutZoneHandler extends Handler {
	
		public override function action(): void{
			var msg: SCOutZoneMessage = SCOutZoneMessage(this.message);
			//TODO 添加消息处理
		}
	}
}