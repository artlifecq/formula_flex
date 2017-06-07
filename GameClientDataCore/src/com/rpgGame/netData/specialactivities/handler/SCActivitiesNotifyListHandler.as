package com.rpgGame.netData.specialactivities.handler{

	import com.rpgGame.netData.specialactivities.message.SCActivitiesNotifyListMessage;
	import org.game.netCore.net.Handler;

	public class SCActivitiesNotifyListHandler extends Handler {
	
		public override function action(): void{
			var msg: SCActivitiesNotifyListMessage = SCActivitiesNotifyListMessage(this.message);
			//TODO 添加消息处理
		}
	}
}