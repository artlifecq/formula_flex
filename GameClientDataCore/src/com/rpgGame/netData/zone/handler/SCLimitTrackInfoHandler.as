package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCLimitTrackInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCLimitTrackInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLimitTrackInfoMessage = SCLimitTrackInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}