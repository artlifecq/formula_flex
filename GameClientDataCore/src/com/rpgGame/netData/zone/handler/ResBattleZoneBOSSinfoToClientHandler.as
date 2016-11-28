package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResBattleZoneBOSSinfoToClientMessage;
	import org.game.netCore.net.Handler;

	public class ResBattleZoneBOSSinfoToClientHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBattleZoneBOSSinfoToClientMessage = ResBattleZoneBOSSinfoToClientMessage(this.message);
			//TODO 添加消息处理
		}
	}
}