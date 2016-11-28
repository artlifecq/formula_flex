package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerAddExpMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerAddExpHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerAddExpMessage = ResPlayerAddExpMessage(this.message);
			//TODO 添加消息处理
		}
	}
}