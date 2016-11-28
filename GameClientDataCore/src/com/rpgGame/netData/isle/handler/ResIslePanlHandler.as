package com.rpgGame.netData.isle.handler{

	import com.rpgGame.netData.isle.message.ResIslePanlMessage;
	import org.game.netCore.net.Handler;

	public class ResIslePanlHandler extends Handler {
	
		public override function action(): void{
			var msg: ResIslePanlMessage = ResIslePanlMessage(this.message);
			//TODO 添加消息处理
		}
	}
}