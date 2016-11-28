package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResZoneCommonTrackInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResZoneCommonTrackInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResZoneCommonTrackInfoMessage = ResZoneCommonTrackInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}