package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCKillInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCKillInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCKillInfoMessage = SCKillInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}