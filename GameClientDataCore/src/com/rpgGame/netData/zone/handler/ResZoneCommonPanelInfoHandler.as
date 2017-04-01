package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResZoneCommonPanelInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResZoneCommonPanelInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResZoneCommonPanelInfoMessage = ResZoneCommonPanelInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}