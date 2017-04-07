package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.SCNoticeMessage;
	import org.game.netCore.net.Handler;

	public class SCNoticeHandler extends Handler {
	
		public override function action(): void{
			var msg: SCNoticeMessage = SCNoticeMessage(this.message);
			//TODO 添加消息处理
		}
	}
}