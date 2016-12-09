package com.rpgGame.netData.offlineres.handler{

	import com.rpgGame.netData.offlineres.message.ResGetOfflineSucMessage;
	import org.game.netCore.net.Handler;

	public class ResGetOfflineSucHandler extends Handler {
	
		public override function action(): void{
			var msg: ResGetOfflineSucMessage = ResGetOfflineSucMessage(this.message);
			//TODO 添加消息处理
		}
	}
}