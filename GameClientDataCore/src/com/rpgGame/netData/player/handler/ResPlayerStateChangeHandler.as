package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerStateChangeMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerStateChangeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerStateChangeMessage = ResPlayerStateChangeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}