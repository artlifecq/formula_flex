package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResTotalOnlineTimeMessage;
	import org.game.netCore.net.Handler;

	public class ResTotalOnlineTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResTotalOnlineTimeMessage = ResTotalOnlineTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}