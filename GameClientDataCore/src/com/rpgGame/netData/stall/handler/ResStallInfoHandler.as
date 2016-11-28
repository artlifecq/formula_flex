package com.rpgGame.netData.stall.handler{

	import com.rpgGame.netData.stall.message.ResStallInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResStallInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResStallInfoMessage = ResStallInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}