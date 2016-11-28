package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResAutoStartStateMessage;
	import org.game.netCore.net.Handler;

	public class ResAutoStartStateHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAutoStartStateMessage = ResAutoStartStateMessage(this.message);
			//TODO 添加消息处理
		}
	}
}