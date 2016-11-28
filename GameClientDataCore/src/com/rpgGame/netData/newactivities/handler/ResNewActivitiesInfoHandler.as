package com.rpgGame.netData.newactivities.handler{

	import com.rpgGame.netData.newactivities.message.ResNewActivitiesInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResNewActivitiesInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResNewActivitiesInfoMessage = ResNewActivitiesInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}