package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResZoneCommonResultInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResZoneCommonResultInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResZoneCommonResultInfoMessage = ResZoneCommonResultInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}