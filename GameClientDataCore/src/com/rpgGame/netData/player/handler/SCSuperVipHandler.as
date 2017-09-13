package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCSuperVipMessage;
	import org.game.netCore.net.Handler;

	public class SCSuperVipHandler extends Handler {
	
		public override function action(): void{
			var msg: SCSuperVipMessage = SCSuperVipMessage(this.message);
			//TODO 添加消息处理
		}
	}
}