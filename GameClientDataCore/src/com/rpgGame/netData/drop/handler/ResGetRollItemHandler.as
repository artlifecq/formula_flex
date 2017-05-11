package com.rpgGame.netData.drop.handler{

	import com.rpgGame.netData.drop.message.ResGetRollItemMessage;
	import org.game.netCore.net.Handler;

	public class ResGetRollItemHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGetRollItemMessage = ResGetRollItemMessage(this.message);
			//TODO 添加消息处理
		}
	}
}