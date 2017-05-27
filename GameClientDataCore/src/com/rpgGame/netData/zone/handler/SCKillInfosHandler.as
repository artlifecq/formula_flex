package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCKillInfosMessage;
	import org.game.netCore.net.Handler;

	public class SCKillInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCKillInfosMessage = SCKillInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}