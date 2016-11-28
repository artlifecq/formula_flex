package com.rpgGame.netData.buff.handler{

	import com.rpgGame.netData.buff.message.ResBuffsMessage;
	import org.game.netCore.net.Handler;

	public class ResBuffsHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBuffsMessage = ResBuffsMessage(this.message);
			//TODO 添加消息处理
		}
	}
}