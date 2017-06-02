package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCMultiZonePanelInfosMessage;
	import org.game.netCore.net.Handler;

	public class SCMultiZonePanelInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMultiZonePanelInfosMessage = SCMultiZonePanelInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}