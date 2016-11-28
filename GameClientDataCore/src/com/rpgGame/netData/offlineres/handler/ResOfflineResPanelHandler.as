package com.rpgGame.netData.offlineres.handler{

	import com.rpgGame.netData.offlineres.message.ResOfflineResPanelMessage;
	import org.game.netCore.net.Handler;

	public class ResOfflineResPanelHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOfflineResPanelMessage = ResOfflineResPanelMessage(this.message);
			//TODO 添加消息处理
		}
	}
}