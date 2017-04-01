package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResSyncServerTimeMessage;
	import org.game.netCore.net.Handler;

	public class ResSyncServerTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSyncServerTimeMessage = ResSyncServerTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}