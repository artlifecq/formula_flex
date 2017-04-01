package com.rpgGame.netData.zone.handler{

	import com.rpgGame.netData.zone.message.ResBossGuideInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResBossGuideInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResBossGuideInfoMessage = ResBossGuideInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}