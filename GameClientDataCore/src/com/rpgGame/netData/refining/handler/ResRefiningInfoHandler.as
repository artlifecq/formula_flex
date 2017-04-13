package com.rpgGame.netData.refining.handler{

	import com.rpgGame.netData.refining.message.ResRefiningInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResRefiningInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResRefiningInfoMessage = ResRefiningInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}