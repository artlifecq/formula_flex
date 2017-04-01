package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerNonageTimeMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerNonageTimeHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerNonageTimeMessage = ResPlayerNonageTimeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}