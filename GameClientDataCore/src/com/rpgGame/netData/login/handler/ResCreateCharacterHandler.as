package com.rpgGame.netData.login.handler{

	import com.rpgGame.netData.login.message.ResCreateCharacterMessage;
	
	import org.game.netCore.net.Handler;

	public class ResCreateCharacterHandler extends Handler {
	
		public override function action(): void{
			var msg: ResCreateCharacterMessage = ResCreateCharacterMessage(this.message);
			//TODO 添加消息处理
		}
	}
}