package com.rpgGame.netData.player.handler{

	import com.rpgGame.netData.player.message.ResPlayerBriefMessage;
	import org.game.netCore.net.Handler;

	public class ResPlayerBriefHandler extends Handler {
	
		public override function action(): void{
			var msg: ResPlayerBriefMessage = ResPlayerBriefMessage(this.message);
			//TODO 添加消息处理
		}
	}
}