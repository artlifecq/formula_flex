package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerNonageStateMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerNonageStateHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerNonageStateMessage = ResPlayerNonageStateMessage(this.message);
			//TODO 添加消息处理
		}
	}
}