package com.rpgGame.netData.login.handler{

	import com.rpgGame.netData.login.message.ResSubstituteMessage;
	import org.game.netCore.net.Handler;

	public class ResSubstituteHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSubstituteMessage = ResSubstituteMessage(this.message);
			//TODO 添加消息处理
		}
	}
}