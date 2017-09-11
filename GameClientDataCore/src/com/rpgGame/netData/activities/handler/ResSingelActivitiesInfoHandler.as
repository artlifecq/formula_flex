package com.rpgGame.netData.activities.handler{

	import com.rpgGame.netData.activities.message.ResSingelActivitiesInfoMessage;
	import org.game.netCore.net.Handler;

	public class ResSingelActivitiesInfoHandler extends Handler {
	
		public override function action(): void{
			var msg: ResSingelActivitiesInfoMessage = ResSingelActivitiesInfoMessage(this.message);
			//TODO 添加消息处理
		}
	}
}