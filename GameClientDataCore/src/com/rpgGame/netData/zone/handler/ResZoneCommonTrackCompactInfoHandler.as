package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResZoneCommonTrackCompactInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResZoneCommonTrackCompactInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResZoneCommonTrackCompactInfoMessage = ResZoneCommonTrackCompactInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}