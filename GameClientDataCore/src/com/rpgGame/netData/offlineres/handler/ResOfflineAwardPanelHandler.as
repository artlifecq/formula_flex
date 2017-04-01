package com.rpgGame.netData.offlineres.handler{

	import com.rpgGame.netData.offlineres.message.ResOfflineAwardPanelMessage;
	import org.game.netCore.net.Handler;

	public class ResOfflineAwardPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOfflineAwardPanelMessage = ResOfflineAwardPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}