package com.rpgGame.netData.destiny.handler{

	import com.rpgGame.netData.destiny.message.ResDestinyInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResDestinyInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResDestinyInfoMessage = ResDestinyInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}