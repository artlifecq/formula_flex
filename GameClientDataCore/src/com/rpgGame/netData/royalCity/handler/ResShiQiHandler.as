package com.rpgGame.netData.royalCity.handler{

	import com.rpgGame.netData.royalCity.message.ResShiQiMessage;
	import org.game.netCore.net.Handler;

	public class ResShiQiHandler extends Handler {
	
		public override function action(): void{
			var msg: ResShiQiMessage = ResShiQiMessage(this.message);
			//TODO 添加消息处理
		}
	}
}