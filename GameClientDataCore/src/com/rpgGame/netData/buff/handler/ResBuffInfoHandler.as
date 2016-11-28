package com.rpgGame.netData.buff.handler{

	import com.rpgGame.netData.buff.message.ResBuffInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResBuffInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBuffInfoMessage = ResBuffInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}