package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerDieMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerDieHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerDieMessage = ResPlayerDieMessage(this.message);
			//TODO 添加消息处理
		}
	}
}