package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.SCMultiZonePanelSingleInfoMessage;
	import org.game.netCore.net.Handler;

	public class SCMultiZonePanelSingleInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: SCMultiZonePanelSingleInfoMessage = SCMultiZonePanelSingleInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}