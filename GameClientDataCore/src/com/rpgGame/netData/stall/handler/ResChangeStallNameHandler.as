package com.rpgGame.netData.stall.handler{

	import com.rpgGame.netData.stall.message.ResChangeStallNameMessage;
	import org.game.netCore.net.Handler;

	public class ResChangeStallNameHandler extends Handler {
	
		public override function action(): void{
			var msg: ResChangeStallNameMessage = ResChangeStallNameMessage(this.message);
			//TODO 添加消息处理
		}
	}
}