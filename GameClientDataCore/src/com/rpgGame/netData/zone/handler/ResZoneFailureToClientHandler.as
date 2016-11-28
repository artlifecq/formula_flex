package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResZoneFailureToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResZoneFailureToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResZoneFailureToClientMessage = ResZoneFailureToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}