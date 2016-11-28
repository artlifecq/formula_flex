package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResBattleZoneClearanceToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResBattleZoneClearanceToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBattleZoneClearanceToClientMessage = ResBattleZoneClearanceToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}