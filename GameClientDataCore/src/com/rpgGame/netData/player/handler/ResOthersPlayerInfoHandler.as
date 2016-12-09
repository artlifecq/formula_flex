package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResOthersPlayerInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResOthersPlayerInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResOthersPlayerInfoMessage = ResOthersPlayerInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}