package com.rpgGame.netData.activities.handler{

	import com.rpgGame.netData.activities.message.ResActivitiesInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResActivitiesInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResActivitiesInfoMessage = ResActivitiesInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}