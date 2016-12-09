package com.rpgGame.netData.isle.handler{

	import com.rpgGame.netData.isle.message.ResIsleTracePanlMessage;
	import org.game.netCore.net.Handler;

	public class ResIsleTracePanlHandler extends Handler {
	
		public override function action(): void{
			var msg: ResIsleTracePanlMessage = ResIsleTracePanlMessage(this.message);
			//TODO 添加消息处理
		}
	}
}