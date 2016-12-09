package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResLeaderBossPanelInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResLeaderBossPanelInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResLeaderBossPanelInfoMessage = ResLeaderBossPanelInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}