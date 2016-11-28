package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResChangePKStateMessage;
	import org.game.netCore.net.Handler;

	public class ResChangePKStateHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangePKStateMessage = ResChangePKStateMessage(this.message);
			//TODO 添加消息处理
		}
	}
}