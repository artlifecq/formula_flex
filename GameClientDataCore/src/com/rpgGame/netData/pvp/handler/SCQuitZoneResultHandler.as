package com.rpgGame.netData.pvp.handler{

	import com.rpgGame.netData.pvp.message.SCQuitZoneResultMessage;
	import org.game.netCore.net.Handler;

	public class SCQuitZoneResultHandler extends Handler {
	
		public override function action(): void{
			var msg: SCQuitZoneResultMessage = SCQuitZoneResultMessage(this.message);
			//TODO 添加消息处理
		}
	}
}