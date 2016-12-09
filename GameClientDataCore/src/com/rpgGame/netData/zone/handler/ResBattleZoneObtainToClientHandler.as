package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResBattleZoneObtainToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResBattleZoneObtainToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBattleZoneObtainToClientMessage = ResBattleZoneObtainToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}