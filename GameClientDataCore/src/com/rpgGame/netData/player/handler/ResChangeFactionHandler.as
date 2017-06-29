package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResChangeFactionMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeFactionHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeFactionMessage = ResChangeFactionMessage(this.message);
			//TODO 添加消息处理
		}
	}
}