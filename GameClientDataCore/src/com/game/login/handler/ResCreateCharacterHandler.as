package com.game.login.handler{

	import com.game.login.message.ResCreateCharacterMessage;
	
	import org.game.netCore.net.Handler;

	public class ResCreateCharacterHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCreateCharacterMessage = ResCreateCharacterMessage(this.message);
			//TODO 添加消息处理
		}
	}
}