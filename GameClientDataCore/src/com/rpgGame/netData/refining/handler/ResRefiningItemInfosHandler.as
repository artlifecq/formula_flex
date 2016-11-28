package com.rpgGame.netData.refining.handler{

	import com.rpgGame.netData.refining.message.ResRefiningItemInfosMessage;
	import org.game.netCore.net.Handler;

	public class ResRefiningItemInfosHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRefiningItemInfosMessage = ResRefiningItemInfosMessage(this.message);
			//TODO 添加消息处理
		}
	}
}