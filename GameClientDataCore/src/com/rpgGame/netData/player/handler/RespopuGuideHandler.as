package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.RespopuGuideMessage;
	import org.game.netCore.net.Handler;

	public class RespopuGuideHandler extends Handler {
	
		public override function action(): void{
			var msg: RespopuGuideMessage = RespopuGuideMessage(this.message);
			//TODO 添加消息处理
		}
	}
}