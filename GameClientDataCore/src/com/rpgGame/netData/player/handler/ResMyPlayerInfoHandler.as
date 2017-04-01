package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResMyPlayerInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResMyPlayerInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResMyPlayerInfoMessage = ResMyPlayerInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}