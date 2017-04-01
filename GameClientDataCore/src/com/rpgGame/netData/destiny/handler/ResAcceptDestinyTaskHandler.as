package com.rpgGame.netData.destiny.handler{

	import com.rpgGame.netData.destiny.message.ResAcceptDestinyTaskMessage;
	import org.game.netCore.net.Handler;

	public class ResAcceptDestinyTaskHandler extends Handler {
	
		public override function action(): void{
			var msg: ResAcceptDestinyTaskMessage = ResAcceptDestinyTaskMessage(this.message);
			//TODO 添加消息处理
		}
	}
}