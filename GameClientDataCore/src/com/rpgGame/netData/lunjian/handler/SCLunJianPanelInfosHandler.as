package com.rpgGame.netData.lunjian.handler{

	import com.rpgGame.netData.lunjian.message.SCLunJianPanelInfosMessage;
	import org.game.netCore.net.Handler;

	public class SCLunJianPanelInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: SCLunJianPanelInfosMessage = SCLunJianPanelInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}