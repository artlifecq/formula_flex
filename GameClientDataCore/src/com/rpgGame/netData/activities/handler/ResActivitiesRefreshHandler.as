package com.rpgGame.netData.activities.handler{

	import com.rpgGame.netData.activities.message.ResActivitiesRefreshMessage;
	import org.game.netCore.net.Handler;

	public class ResActivitiesRefreshHandler extends Handler {
	
		public override function action(): void{
			var msg: ResActivitiesRefreshMessage = ResActivitiesRefreshMessage(this.message);
			//TODO 添加消息处理
		}
	}
}